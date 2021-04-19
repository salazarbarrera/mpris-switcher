#!/usr/bin/env python
import dbus
import argparse

def zenity_printer(bus):
  bus_list = ''
  for service in bus.list_names():
    if service.startswith('org.mpris.MediaPlayer2.') and service != args.IGNORE:
     bus_list += service+' '
     if args.one:
       break
  print(bus_list)

def normal_printer(bus):
  for service in bus.list_names():
    if service.startswith('org.mpris.MediaPlayer2.') and service != args.IGNORE:
     print (service)
     if args.one:
      break

parser = argparse.ArgumentParser(description='List all the names of connections on the session bus associated to MediaPlayer2 object.')
parser.add_argument('--ignore',  dest='IGNORE', metavar='NAME', 
                    default='',
                    help='Specify the name of the connection to ignore.)')          
parser.add_argument('--zenity', action='store_true')
parser.add_argument('--one', action='store_true')
args = parser.parse_args()


bus = dbus.SessionBus()
if(args.zenity):
  zenity_printer(bus)
else:
  normal_printer(bus)



