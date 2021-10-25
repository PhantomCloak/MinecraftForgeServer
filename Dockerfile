
FROM openjdk:8

COPY . /usr/src/mcserver/mods

WORKDIR /usr/src/mcserver

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar
RUN java -jar forge-1.12.2-14.23.5.2855-installer.jar --install
RUN echo "eula=true" > eula.txt
RUN echo "max-tick-time=60000\ngenerator-settings=\nallow-nether=true\nforce-gamemode=false\ngamemode=0\nenable-query=false\nplayer-idle-timeout=0\ndifficulty=3\nspawn-monsters=true\nop-permission-level=4\npvp=true\nsnooper-enabled=true\nlevel-type=DEFAULT\nhardcore=false\nenable-command-block=false\nmax-players=6\nnetwork-compression-threshold=256\nresource-pack-sha1=\nmax-world-size=29999984\nserver-port=25565\nserver-ip=\nspawn-npcs=true\nallow-flight=true\nlevel-name=world\nview-distance=10\nresource-pack=\nspawn-animals=true\nwhite-list=false\ngenerate-structures=true\nonline-mode=false\nmax-build-height=256\nlevel-seed=\nprevent-proxy-connections=false\nuse-native-transport=true\nmotd=A\nMinecraft\nServern enable-rcon=false\nspawn-protection=0" > server.properties
RUN chmod a=r server.properties
CMD ["java","-Xms7096M","-Xmx7096M","-XX:+UseG1GC","-Duser.language=en","-XX:+ParallelRefProcEnabled","-XX:MaxGCPauseMillis=200","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:+AlwaysPreTouch","-XX:G1NewSizePercent=30","-XX:G1MaxNewSizePercent=40","-XX:G1HeapRegionSize=8M","-XX:G1ReservePercent=20","-XX:G1HeapWastePercent=5","-XX:G1MixedGCCountTarget=4","-XX:InitiatingHeapOccupancyPercent=15","-XX:G1MixedGCLiveThresholdPercent=90","-XX:G1RSetUpdatingPauseTimePercent=5","-XX:SurvivorRatio=32","-XX:+PerfDisableSharedMem","-XX:MaxTenuringThreshold=1","-Dusing.aikars.flags=https://mcflags.emc.gs","-Daikars.new.flags=true","-Duser.region=EN","-jar","forge-1.12.2-14.23.5.2855.jar","-Dfml.queryResult=confirm","nogui"]
