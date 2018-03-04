# Kubernetes Helper Scripts

A number of simple bash scripts to help with daily kubectl tasks.

## Installation

A `Makefile` and installation scripts have been added for convenience. To install, the following should be enough:

```bash
git clone https://github.com/juliohm1978/kubernetes-helper-scripts.git
cd kubernetes-helper-scripts
make install
```

A list of the files to be copied will be presented and a prompt will wait before continuing.

To change the installation directory, override INSTALLDIR:

```bash
INSTALLDIR=/my/custom/bin make install
```

To skip any confirmation, define the variable `SKIP_CONFIRMATION=true`.

```bash
SKIP_CONFIRMATION=true INSTALLDIR=/my/custom/bin make install
```

**NOTE**: The installation script will NOT backup any files already in the destination directory. They will be overwritten.

To uninstall:

```bash
make uninstall
```

**NOTE 2**: Installation will NOT remove files from a previous version.

To make sure any files from a previous version are not left behind, you will need to uninstall that version before installing a new one.

## Manual Installation

To use, simply copy from `bin/*` into a known path location in your system, for example `/usr/local/bin`. Mark them as executable and enjoy.

```bash
chmod +x bin/*
sudo cp bin/* /usr/local/bin/
```

## How To Use

`k` is basically a shorthand for `kubectl`. By default, it should work as an alias and all command line parameters will be streamlined into `kubectl`.

```bash
k get nodes
```

... should be the same as:

```bash
kubectl get nodes
```

The main difference from using `kubectl` directly is the ability to define the current namespace using a local temporary environment variable. Simply define `export namespace=mynamespace` and all subsequent calls to `k` will be equivalent to `kubectl -n mynamespace`.

```bash
export namespace=mynamespace
k get pods
```

... is the same as:

```bash
kubectl -n mynamespace get pods
```

To make things even simpler, shorter named scripts are also available. For example, `kpods` is another shorthand for `k get pods`. Once `$namespace` is defined, getting all pods from that namespace should be as easy as:

```bash
kpods
```

Handling pods from the command line should be much easier when you wish to focus on one particular namespace.

```bash
$ export namespace=frontend

$ kpods
NAME                               READY     STATUS    RESTARTS   AGE
defaultbackend-644697fdfd-g59h9    1/1       Running   0          1d
klego-kube-lego-56fb6cc774-mqhvq   1/1       Running   2          27d
nginx-6j76t                        2/2       Running   0          11h
nginx-jqsbl                        2/2       Running   0          11h

$ kdelete pod nginx-jqsbl
pod "nginx-jqsbl" deleted

$ klogs nginx-6j76t -c nginx

<snipped>
```

Whenever `$namespace` is not defined or empty, the default namespace is used.

## Available Scripts

The following is a complete list of available scripts that follow that same idea.

Script | Equivalent kubectl
------ | ------------------
`k` | `kubectl -n $namespace`
`kapply` | `kubectl -n $namespace apply`
`kdelete` | `kubectl -n $namespace delete`
`kedit` | `kubectl -n $namespace edit`
`kget` | `kubectl -n $namespace get`
`klogs` | `kubectl -n $namespace logs`
`knodes` | `kubectl -n $namespace get nodes`
`kpods` | `kubectl -n $namespace get pods`
`kallpods` | `kubectl get pods --all-namespaces`
