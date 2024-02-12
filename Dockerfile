FROM openjdk:8

COPY . /usr/src/mcserver/mods

WORKDIR /usr/src/mcserver

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar
RUN java -jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --install
RUN echo "eula=true" > eula.txt
RUN echo "max-tick-time=60000\ngenerator-settings=\nallow-nether=true\nforce-gamemode=false\ngamemode=0\nenable-query=false\nplayer-idle-timeout=0\ndifficulty=3\nspawn-monsters=true\nop-permission-level=4\npvp=true\nsnooper-enabled=true\nlevel-type=RTG\nhardcore=false\nenable-command-block=false\nmax-players=6\nnetwork-compression-threshold=256\nresource-pack-sha1=\nmax-world-size=29999984\nserver-port=25565\nserver-ip=\nspawn-npcs=true\nallow-flight=true\nlevel-name=world\nview-distance=16\nresource-pack=\nspawn-animals=true\nwhite-list=false\ngenerate-structures=true\nonline-mode=false\nmax-build-height=256\nlevel-seed=\nprevent-proxy-connections=false\nuse-native-transport=true\nmotd=A\nMinecraft\nServern enable-rcon=false\nspawn-protection=0" > server.properties
RUN chmod a=r server.properties
CMD ["java","-Xms8096M","-Xmx8096M","-XX:+UseG1GC","-Duser.language=en","-XX:+ParallelRefProcEnabled","-XX:MaxGCPauseMillis=200","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:+AlwaysPreTouch","-XX:G1NewSizePercent=30","-XX:G1MaxNewSizePercent=40","-XX:G1HeapRegionSize=8M","-XX:G1ReservePercent=20","-XX:G1HeapWastePercent=5","-XX:G1MixedGCCountTarget=4","-XX:InitiatingHeapOccupancyPercent=15","-XX:G1MixedGCLiveThresholdPercent=90","-XX:G1RSetUpdatingPauseTimePercent=5","-XX:SurvivorRatio=32","-XX:+PerfDisableSharedMem","-XX:MaxTenuringThreshold=1","-Dusing.aikars.flags=https://mcflags.emc.gs","-Daikars.new.flags=true","-Duser.region=EN","-Dfml.readTimeout=60","-Dsun.rmi.dgc.server.gcInterval=600000","-jar","forge-1.7.10-10.13.4.1614-1.7.10-universal.jar","-Dfml.queryResult=confirm","nogui"]
