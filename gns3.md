# GNS3 manual

In this section, we describe all `GNS3` panels and functions.

## Panels

When you open `GNS3` and open or create topology, see something like this image. The list of all panel that you see in `GNS3` written as follows. Commonly used command is **bolded**.

![gns3-view](./img/gns3-view.jpg)

1. Tool bar (1 and 2 for manage project )
    1. **New Project** (*Project Library* in other tab)
    2. Open Project
    ---
    3. Manage snapshot
    4. **Show/Hide Interfaces**
    ---
    5. **Console to all devices**
    7. **Start/Resume all devices**
    8. Suspend all devices
    9. Stop all devices
    10. Reload all devices
    ---
    11. Add a note
    12. Insert a picture
    13. Draw rectangle
    14. Draw ellipse
    15. Draw line
    16. Lock/Unlock devices
    17. Zoom in
    18. Zoom out
    19. Take snapshot
2. Network devices
    1. **Browse routers**
    2. **Browse switches**
    3. **Browse end devices**
    4. Browse security devices
    5. **Browse all devices** (show all device in previous category)
    6. **Add link**
3. Topology summery
    * List all devices in Topology (`Node Name` & `Console Connection Command`)
        * Right click: see all node commands (see [Project Devices](#project-devices))
    * In SubItem see all interfaces and link status (capture state, filter state, ...)
        * Right click: see all link commands (see [Link](#link))
4. Server summery
    * List all connected server (with system load)
        * SubItem: List all node in selected server
5. Console
    * Print all `GNS3` log (docker pull, connection failure, command failed or ...)
6. **Topology view**
    * Show all node and device with link (The Topology)
    * **Add device** by dragging them from it's panel (router, switch, host, ...)
    * **Add link** between devices by click on [link](#link) and click on first device and then second device
    * You can group devices, Add label
    * You can drag and organize topology

## Projects

The project in `GNS3` is a saved state of topology in disk. You can create, open or load new project. The `GNS3` save all configuration for devices **except** route config (need to enabled in route configuration panel).

### New Project

To create new project, you can click on **`File > New blank project Ctrl+N`** or click on **`New project`** in panel.
You can set project **name** and **location** and then press **`OK`** button.

![gns3-new-project](./img/gns3-new-project.jpg)

### Open Project

To open `GNS3` project you can click on **`File > Open project Ctrl+O`** or click on **`Open project`** in panel.
Also it available in `Project` panel under `New project` tab.

You can open **recently** project under **`File`** menu and `Project` panel under `New project` tab.

The `Project library` tab in `Project` panel, is the list of all project under default `GNS3` project path (can see or change in `GNS3` preferences).
You can **delete** or duplicate the selected project.

![gns3-project-library](./img/gns3-project-library.jpg)

### Save Project

The `GNS3` save all modification on the topology on each change and not need to save the project.
Also `GNS3` have **`File > Save project as`** menu to save the project with different project **name** and **location**.

### Export Project

The `GNS3` have ability to save all project topology and it's resource like device image (docker, router, ...) and share with other.
If you don't select `Include base images`, the target `GNS3` must loaded the resource before use topology.

![gns3-export](./img/gns3-export.jpg)

### Import Project

In `GNS3` you can import the exported project. If the selected portable project don't include the base images, you must load them before start topology.

## Project Devices

The `GNS3` support [host](#hosts), [switches](#switch-or-hub), [router](#router), [security](#security-devices) devices plus [link](#link).
You can add device from `GNS3` template or import manually from `GNS3` `Preferences`.

To add a new device to your project, you can open device panel and **drag** device to you topology.

### Hosts

<img src="./img/gns3-host-menu.jpg"  align="right" left-margin=10pt>

`GNS3` support the following host type that can managed in `GNS3` > `Preferences`.
The docker host is the lightest host in `GNS3`.
You can add custom host in `GNS3` > `Preferences`.

* docker based
* qemu based
* Virtual-box VM based
* VMware VM based

After you add host to your topology, you can **right click** on the new host and see menu.
You can configure the host, Open console or Auxiliary console (open secondly console **only for docker** host), start/stop/suspend/reload host, change symbol, change ip and etc.

The configure panel of host consist all config that can edited for host.
In the below describe each item:

* `Name`: Host name (has shortcut in host menu)
* `Start command`: custom start command when you start the host (can add new service startup or config change)
* `Adapters`: number of host network adapter
* `Custom adapters`: can edit adaptors name
* `Console type`:
* `VNC console resoloution`:
* `HTTP port in the container`: the port number for **HTTP** and **HTTPS** that map to outer host and use in browser when click on host and select open console.
* `HTTP path`:
* `Environment variables`: the linux **env** value
* `Network configuration`: to edit `/etc/network/interfaces` of the host. Also you can select `Edit config` in host menu (a shortcut to edit network configuration)

![gns3-host-config-panel](./img/gns3-host-config-panel.jpg)

<img style="float: right; margin-left: 10pt;" src="./img/gns3-host-config-adv.jpg">

In the `Advanced` tab, you can set `/etc/hosts` file. The syntax of the config is different with the original file.
You can set `host-name:IP` per line to set `hosts` and `IPs` map.
If you set this parameters, you can use the `hostname` instead `IP` in network command.
The `/etc/hosts` file like a local `DNS` server.

### Switch or Hub

<img src="./img/gns3-switch-menu.jpg"  align="right" left-margin=10pt>

### Router

<img src="./img/gns3-router-menu.jpg"  align="right" left-margin=10pt>

### Security devices

### link

#### Packet Filter

#### Packet Capture

### Node console

## GNS3 Web-UI (beta)

You can see beta release of `GNS3` web-ui in this link. You need start **gns3-server** (in local mode of `GNS3` you can run **gns3-gui**. It also run **gns3-server**) before open this link.

* http://localhost:3080/static/web-ui/bundled

## Preferences

You can see `GNS3` preferences manual in [this link](./gns3-setting.md)
