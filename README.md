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

To make things even simpler, `kpods` is also available, which is another shorthand for `k get pods`. Once your namespace environment variable is defined, getting all pods from that namespace should be as easy as:

```bash
kpods
```

This way, handling pods from the command line should be easier when you wish to focus on one particular namespace.

```bash
root@node0:~# export namespace=frontend

root@node0:~# kpods
NAME                               READY     STATUS    RESTARTS   AGE
defaultbackend-644697fdfd-g59h9    1/1       Running   0          1d
klego-kube-lego-56fb6cc774-mqhvq   1/1       Running   2          27d
nginx-6j76t                        2/2       Running   0          11h
nginx-jqsbl                        2/2       Running   0          11h

root@node0:~# k delete pod nginx-jqsbl
pod "nginx-jqsbl" deleted

root@node0:~# k logs nginx-6j76t -c nginx
......
```