# GitHub Action - Install Istio

This GitHub Action installs istioctl into the local build environment.
From there `istioctl` can be used to install istio and manage deployments.

## Usage

### Pre-requisites

Create a workflow `.yml` file in your repositories `.github/workflows` directory.
An [example workflow](#example-workflow---build-rpm) is available below. For more information, reference the GitHub Help Documentation for [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

**Note:** You need to have a spec file in order to build RPM.

### Inputs

* `version`: The version of Istio to install.
Acceptable values are latest or any semantic version string like `1.9.7`.
Use this action in workflow to define which version of Istioctl will be used.

### Outputs

* `istioctl_path`: path to istioctl

### Example workflow - Install Istio

Basic:

```yaml
name: Install Istio
on: push

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: install Istio
      id: istio
      uses: global-science-technology-inc/install-istio@main
      with:
        version: "latest"

    - name: Deploy istio
      run: ${{ steps.istio.outputs.istioctl_path }}/istioctl install --set profile=demo -y
```

This workflow triggered on every `push`, installs Istio and then deploys to a K8s cluster.

## Contribute

Feel free to contribute to this project. Read [CONTRIBUTING Guide](CONTRIBUTING.md) for more details.

## References

* [RPM Packaging Guide](https://rpm-packaging-guide.github.io/)
* [GitHub Learning Lab](https://lab.github.com/)
* [Container Toolkit Action](https://github.com/actions/container-toolkit-action)

## License

The scripts and documentation in this project are released under the [GNU GPLv3](LICENSE)

forked from [zfardhiyaulhaq/setup-istioctl.git](https://github.com/zufardhiyaulhaq/setup-istioctl.git)
