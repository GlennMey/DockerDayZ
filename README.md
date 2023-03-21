# DockerDayZ

## Useful resources
1. [DayZ Server Configuration on Bohemia's wiki](https://community.bistudio.com/wiki/DayZ:Server_Configuration)

## Needed manual actions
- Mount the `whitelist.txt` / `priority.txt` files in the Docker Compose file
- Remote access via RCON isn't enabled by default. You can configure that [by following the steps on Bohemia's wiki](https://community.bistudio.com/wiki/DayZ:Server_Configuration#BattlEye_Configuration)
    - Unless `-bePath` is used, the path for BattlEye is: `server_files/battleye/beserver_x64.cfg`
    - You will also need to **forward** the RCON port in the `docker-compose.yml` file. Default is `2303` (`gamePort + 1 = rconPort`)

## Setup
1. Run `docker-compose up -d` to start up the server. It will download the server files into `server_files` (unless changed in `docker-compose.yml`).
2. Run `docker-compose logs -ft` to watch the console/server logs. Hit CTRL+C to get out of the logs.

Once you're done with the server, run `docker-compose down` to shut the server/container down.  
If you wanna boot it back up, just run `docker-compose up -d` again.

### Modifications to startup script
If you have modified (`run_server.sh`), rebuild the container for script changes to apply.

Assuming you already have a running server while modifying the script:
1. `docker-compose down` to stop the server
2. `docker-compose build` to rebuild the container
3. `docker-compose up -d` to start the server back up again.
