# Kubernetes Helper Scripts

A number of simple bash scripts to help with daily kubectl tasks.

## Installation

To use, simply copy all files from `bin/*` into a known path location in your system - i.e. `/usr/local/bin`, mark them as executable and enjoy.

```bash
chmod +x bin/*
sudo cp bin/* /usr/local/bin/
```

## How To Use

`k` is basically a shorthand for `kubectl`. By default, it should work as an alias.

```bash
k get nodes
```

... should be equivalent to:

```bash
kubectl get nodes
```

The main difference from using kubectl directly is the ability to define the current namespace using a local temporary environment variable. Simply define `export namespace=mynamespace` and all subsequent calls to `k` will equivalent to `kubectl -n mynamespace`.

```bash
export namespace=mynamespace
k get pods
```

... is the same as:

```bash
kubectl -n mynamespace get pods
```