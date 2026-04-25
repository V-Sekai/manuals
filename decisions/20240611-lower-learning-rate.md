# Draft: Switch learning rate to be lower

## The Context

We are currently training a mesh transformer's auto encoder.

## The Problem Statement

The current learning rate might not be optimal for our training process. We need to find a way to adjust it dynamically based on the progress of the training.

## Design

We propose to monitor the reconstruction loss after each epoch. If the loss decreases by less than 0.004 per epoch, we switch the learning rate to 1e-4.

**Note:** Don't forget to change the load method that the model uses to load the model.

## The Benefits

By adjusting the learning rate based on the progress of the training, we can potentially achieve better results and prevent overfitting.

## The Downsides

This approach requires careful monitoring of the training process and might require additional computational resources.

## The Road Not Taken

An alternative could be to use a fixed learning rate throughout the training process. However, this might not yield optimal results.

## The Infrequent Use Case

This approach might not be suitable for all types of models or datasets.

## In Core and Done by Us

This proposal is made by the V-Sekai development team and will be implemented by us.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, 20240611-lower-learning-rate

## Further Reading


