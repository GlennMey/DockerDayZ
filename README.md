# DockerDayZ

- **Workshop content only**: A Steam account with DayZ
    - Steam does not allow downloading workshop content "anonymously".

## Useful resources
1. [DayZ Server Files Documentation on DayZ Forums](https://forums.dayz.com/topic/239635-dayz-server-files-documentation/)
2. [DayZ Server Configuration on Bohemia's wiki](https://community.bistudio.com/wiki/DayZ:Server_Configuration)

## Needed manual actions
- Mount the `whitelist.txt` / `priority.txt` files in the Docker Compose file
- Remote access via RCON isn't enabled by default. You can configure that [by following the steps on Bohemia's wiki](https://community.bistudio.com/wiki/DayZ:Server_Configuration#BattlEye_Configuration)
    - Unless `-bePath` is used, the path for BattlEye is: `server_files/battleye/beserver_x64.cfg`
    - You will also need to **forward** the RCON port in the `docker-compose.yml` file. Default is `2303` (`gamePort + 1 = rconPort`)

## Setup
1. Edit `serverDZ.cfg`.
2. Edit the file `docker-compose.yml` to match your server needs.
    - Make sure all the paths (volumes), environment variables (for extra configuring) and memory limit matches what you want to limit your system to.
    - `CPU_COUNT` is practically "thread count". Run `nproc`.
3. Run `docker-compose up -d` to start up the server. It will download the server files into `server_files` (unless changed in `docker-compose.yml`).
4. **Optional**: Run `docker-compose logs -ft` to watch the console/server logs. Hit CTRL+C to get out of the logs.

Once you're done with the server, run `docker-compose down` to shut the server/container down.  
If you wanna boot it back up, just run `docker-compose up -d` again.

Server updates will run using [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) every time the server is started back up, so it might take a few extra seconds.

### Modifications to startup script
If you have modified (`run_server.sh`), rebuild the container for script changes to apply.

Assuming you already have a running server while modifying the script:
1. `docker-compose down` to stop the server
2. `docker-compose build` to rebuild the container
3. `docker-compose up -d` to start the server back up again.

## Workshop content
For workshop content, run `./download.sh -w WORKSHOP_ID_HERE`, which will prompt you for your Steam username _and_ a "Workshop mod name".  
Specifically for DayZ workshop content you need a Steam account that owns DayZ.

- The "Workshop mod name" is used to create a folder within `server_files/<Workshop Mod Name Here>`, where mod files are later copied into.
- All workshop content will be downloaded to the `workshop_mods` folder.

### Mod support
For mod support you will have to investigate yourself. You'll have to modify the launch options in `run_server.sh`, then rebuild the container using `docker-compose build` before (re)starting the server.
