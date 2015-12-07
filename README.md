# Symfony Installer with docker

## PHP Version

* PHP 7

## Important

* Generate project with current host user: `-u $(id -u):$(id -g)`
* Generate project on host filesystem: `-v $(pwd):/app`

## Last version Symfony project (3.0 at this date)

```
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/app ypereirareis/symfony-installer new PROJECT_NAME
```

## Symfony 2.8

```
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/app ypereirareis/symfony-installer new PROJECT_NAME 2.8
```

## Other versions

```
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/app ypereirareis/symfony-installer new PROJECT_NAME VERSION_NUMBER
```

## Help

```
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/app ypereirareis/symfony-installer
```
