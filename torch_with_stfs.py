import io
import time

import numpy as np
import torch
import torch.nn as nn
import torchvision.transforms as t
from torch.utils.tensorboard import SummaryWriter
from PIL import Image
from torch.utils.data import Dataset, DataLoader
from torchvision.models import resnet50
import random

import scaletorch as st
st.init(verbose=None)

writer = SummaryWriter(f'{st.get_artifacts_dir()}/tensorboard')

def get_train_transform():
    return t.Compose([
        t.RandomHorizontalFlip(p=0.5),
        t.RandomRotation(15),
        t.RandomCrop(204),
        t.ToTensor(),
        t.Normalize((0, 0, 0), (1, 1, 1))
    ])


def accuracy(preds, trues):
    preds = [1 if preds[i] >= 0.5 else 0 for i in range(len(preds))]
    acc = [1 if preds[i] == trues[i] else 0 for i in range(len(preds))]
    acc = np.sum(acc) / len(preds)

    return acc * 100


class ImageDataset(Dataset):
    def __init__(self, transforms=None):
        super().__init__()
        print('Initializing ')
        self.transforms = transforms
        self.imgs = st.list_files('gs://st-opendataset/c3.staticflickr.com/1/103/', 'st-opendataset/c3.staticflickr.com/**.jpg')[:100]
        print(self.imgs)

    def __getitem__(self, idx):
        image_name = self.imgs[idx]
        with st.open(f"gs://{image_name}", 'rb') as file:
            img = Image.open(io.BytesIO(file.read()))
        img = img.resize((224, 224)).convert('RGB')

        # Preparing class label
        label = torch.tensor(0, dtype=torch.float32)

        # Apply Transforms on image
        if self.transforms:
            img = self.transforms(img)
        
        return img, label

    def __len__(self):
        return len(self.imgs)


def main():
    train_dataset = ImageDataset(transforms=get_train_transform())

    train_data_loader = DataLoader(
        dataset=train_dataset,
        num_workers=4,
        batch_size=16,
        shuffle=True
    )

    device = torch.device('cpu')

    model = resnet50(pretrained=True)

    model.fc = nn.Sequential(
        nn.Linear(2048, 1, bias=True),
        nn.Sigmoid()
    )

    optimizer = torch.optim.Adam(model.parameters(), lr=0.0001)
    lr_scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=5, gamma=0.5)
    criterion = nn.BCELoss()
    epochs = 1
    model = model.to(device)

    print('Training has begun...')
    for epoch in range(epochs):
        
        print(f'Starting epoch: {epoch}')
        epoch_loss = []
        epoch_acc = []
        start_time = time.time()

        for images, labels in train_data_loader:
            images = images.to(device)
            labels = labels.to(device)
            labels = labels.reshape((labels.shape[0], 1))  # [N, 1] - to match with preds shape
            
            writer.add_scalar('metric_1', random.randint(1, 1000), epoch)
            writer.add_scalar('metric_2', random.randint(1, 1000), epoch)
            st.track(epoch=epoch, metrics = {'metric_1': random.randint(1, 1000), 
                                            'metric_2':random.randint(1, 1000)},
                                            tuner_default='metric_1')

            print(f'Images shape: {images.shape}')
            print(f'labels shape: {labels.shape}')

        #     # Reseting Gradients
        #     optimizer.zero_grad()

        #     # Forward
        #     preds = model(images)

        #     # Calculating Loss
        #     _loss = criterion(preds, labels)
        #     loss = _loss.item()
        #     epoch_loss.append(loss)

        #     # Calculating Accuracy
        #     acc = accuracy(preds, labels)
        #     epoch_acc.append(acc)

        #     # Backward
        #     _loss.backward()
        #     optimizer.step()

        # end_time = time.time()
        # total_time = end_time - start_time

        # loss = np.mean(epoch_loss)
        # acc = np.mean(epoch_acc)

        # print(f"Epoch: {epoch + 1} | Loss: {loss} | Acc: {acc} | Time: {total_time} ")
    
    writer.close()


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--batch_size", help="echo the string you use here", default=32)
    parser.add_argument("--hidden_size", help="echo the string you use here", default=32)
    parser.add_argument("--lr", help="echo the string you use here", default=32)
    parser.add_argument("--momentum", help="echo the string you use here", default=32)

    args = parser.parse_args()
    print(args)
    main()
