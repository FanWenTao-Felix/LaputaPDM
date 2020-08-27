alibaba sentinel

java -Dsentinel.dashboard.auth.username=admin \	
-Dsentinel.dashboard.auth.password=admin \	
-Dserver.port=5020 -Dcsp.sentinel.dashboard.server=localhost:5020 \	
-jar sentinel-dashboard-1.7.1.jar &



nohup java -Dserver.port=5020 -Dcsp.sentinel.dashboard.server=localhost:5020 -jar sentinel-dashboard-1.7.1.jar &