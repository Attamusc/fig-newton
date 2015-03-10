# `fig-newton`

Wrapper tooling around fig to manage application stacks.

## Rationale

`fig` is fantastic for keeping track of the various pieces required to describe dockerized applications. However, it's descriptor is not great for SOA applications, as any change to architecture would require changing the `fig.yml` of all pieces. `fig-newton` attempts to address that shortcoming by letting individual applications be described using fig, while stacks of applications can be described using a similar yml file.

## Usage

```
fig-newton [OPTIONS] <COMMAND> <STACK_NAME>
```

### `init STACK_NAME`

Generate a skeleton description file for the `STACK_NAME` application stack

### `clone STACK_NAME`

#### Options

| Option | Meaning |
| ------ | ------- |
| parent_directory | The parent directory of the cloned repositories. Can be an absolute path or relative to the current directory |

Use `git` to pull down the repositories for the given stack

### `up STACK_NAME`

Bring up all the applications defined for the given stack. Equivalent to running `fig up` in each application directory.

### `down STACK_NAME`

Bring down all the applications defined for the given stack. Equivalent to running `fig down` in each application directory.

### `pull STACK_NAME`

Pull the latest code for all the repos defined for the given stack. Equivalent to running `git pull` in each application directory.
