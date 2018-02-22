# Kubernetes Helper Scripts

A number of simple bash scripts to help with daily kubectl tasks.

## Installation

To use, simply copy all files from `bin/*` into a known path location in your system - i.e. `/usr/local/bin`, mark them as executable and enjoy.

```bash
chmod +x bin/*
sudo cp bin/* /usr/local/bin/
```

## Usage

`k` is basically a shorthand for `kubectl`. By default, it should work as an alias.

```
k get nodes
```

... should be equivalent to

```
kubectl get nodes
```