# OctoPrint-Klipper

My version of a Docker image for running [OctoPrint] and [Klipper] in a single container. Includes a few plugins I find useful.

Big thanks to [sillyfrog](https://github.com/sillyfrog) for laying the groundwork for this image.
I stole most of my implementation from [seanauff](https://github.com/seanauff) (even this readme)


This is very much written for my purposes, so you'll likely need to modify it for your setup. I've been using it for a while now and it's going well. I've successfully run it on these platforms:
* amd64

## Running the container

Create a directory on your host that will persist config files. I use `/home/docker/octoprint-klipper`.

docker pull daller/octoprint-klipper:[tag]
```

Start the container once to populate your config folder:

```
docker run -d --name octoprint-klipper -e TZ=America/New_York -v /home/docker/octoprint-klipper:/home/octoprint/.octoprint --device /dev/ttyUSB0:/dev/ttyUSB0 -p 5000:5000 seanauff/octoprint-klipper:[tag]
```






Stop the container, and modify your [Klipper] `printer.cfg` and [Octoprint] `config.yaml` in the config directory as needed.

Restart the container.
open a terminal go to /home/octoprint/klipper and run make menuconfig to configure for your needs.
in octoprint go to the octoklipper settings and edit location for config file to /home/octoprint/.octoprint/printer.cfg and also log file /home/octoprint/.octoprint/klippy.log

A sample docker-compose file is also provided.

If you have any questions, feel free to log an issue on this project, and I'll see if I can help.

## Updates

The easiest way to update is to pull the latest image and recreate the container. You could also build the image yourself to get the latest updates. I have had success in using the Octoprint built in updater to upgrade plugins, as well as install new ones. Any upgrades conducted in this manner will be lost upon recreation of the container.

## Build the image yourself

The DockerHub images may not be as up to date as the repo (`amd64` is autobuilt, but not `arm`), so you can ensure you have the latest by building yourself.

Clone the repository and build the image:

```shell
git clone https://github.com/seanauff/OctoPrint-Klipper.git
docker build -t seanauff/octoprint-klipper OctoPrint-Klipper
```

If you already have an image built and are trying to upgrade, you may need to force the build not to use cache:
```shell
docker build -t seanauff/octoprint-klipper --no-cache -pull OctoPrint-Klipper
```

[Octoprint]: https://github.com/foosel/OctoPrint
[Klipper]: https://github.com/KevinOConnor/klipper




TODO:
Latest ubuntu and running python3. Also working on fixes for the serialdevice to be accesseble after reboot..

TODO
UNRAID template
USB passthrough needs to be improved