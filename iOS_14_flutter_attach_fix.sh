InfoPlistPath=xxx/xxx-Info.plist
echo $InfoPlistPath
echo "Flutter Start Fix🍺🍺🍺"
if [ -f $InfoPlistPath ];then
  LocalNetworkUsageDescription=$(/usr/libexec/PlistBuddy -c "Print NSLocalNetworkUsageDescription" "${InfoPlistPath}")
  if test -z "$LocalNetworkUsageDescription"
  then
      /usr/libexec/PlistBuddy -c 'Add :NSLocalNetworkUsageDescription string Allow Flutter tools on your computer to connect and debug your application' $InfoPlistPath
      echo "added NSLocalNetworkUsageDescription"
  else
      echo "LocalNetworkUsageDescription is set! value is:$LocalNetworkUsageDescription"
  fi
  
  NSBonjourServices=$(/usr/libexec/PlistBuddy -c "Print NSBonjourServices" "${InfoPlistPath}")
  if test -z "$NSBonjourServices"
  then
      /usr/libexec/PlistBuddy -c 'Add :NSBonjourServices array' $InfoPlistPath
      /usr/libexec/PlistBuddy -c 'Add :NSBonjourServices: string "_dartobservatory._tcp"' $InfoPlistPath
      echo "added Bonjour services"
  else
      echo "Bonjour services is set! value is:$NSBonjourServices"
  fi
    
      echo "Mission completed🎉🎉🎉"
  
else
  echo "not exist info.plist path"
fi
