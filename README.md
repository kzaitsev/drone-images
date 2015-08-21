# Docker images for drone.io

https://drone.io is open-sourced continuous integration service. It runs tests of project inside docker container. 

## Goal

This repo provides Dockerfiles for languages which could run on drone.io.

## Example

If you want to test ruby app, inside .drone.yml file you should have:

```
image: bugagazavr/ruby:2.1.5
```

# Credits

* [Bugagazavr](https://github.com/Bugagazavr)

## License
drone-images is MIT-licensed.
