# desktop-gui
Run this command:

With Flutter:
```
flutter pub add roslibdart
```

# Usage
## Install rosbridge 
You can 
```
# install using apt-get
sudo apt-get install ros-foxy-rosbridge-server
#  or you can clone from github
cd ros_ws/src
git clone https://github.com/RobotWebTools/rosbridge_suite
cd ..
colcon build
```

# Run ros bridge 
```
cd ros_ws
source install/local_setup.bash
ros2 launch rosbridge_server rosbridge_websocket_launch.xml
```

For more details visit [here](https://pub.dev/packages/roslibdart)


Import it
Now in your Dart code, you can use:
```
import 'package:roslibdart/roslibdart.dart';
```


run the following comand for the flutter app to publish and subsribe.
```
ros2 run rosbridge_server rosbridge_websocket
```
