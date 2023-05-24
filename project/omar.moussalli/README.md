# Netmon
Netmon stands for Network Monitor is a bash script file that display network traffic for a sepcified interface.

## Description
This is a tool for monitoring network traffic on a specific interface. It has many options for customizing the network traffic displayed.

It displays the packet number, the time that the packet took to arrive, the source IP of the packet, the destination IP of the packet, the protocol used, the port source, and port destination, the protocol used, and data about that protocol. All that is done with the help of the command ***tshark***.

Note that supported protocols are HTTP/HTTPS, DNS, TCP, UDP, SSH, and ICMP.

First it gives a list of available of interfaces to monitor, using the following command:
``` bash
tshark -D
``` 

It have a filter option for filtering results, like only displaying network traffic related to HTTPS requests. You can specify the port number and/or protocol.

You can limit the number of packages display, or specify a time for the monitoring to stop. By default is 20.

The traffic is stored in a file with .pcap extension. With this extension you can open the file with [Wireshark](https://www.wireshark.org/docs/).

For more information about tshark visit the following videos:
1. ![](https://www.youtube.com/watch?v=HoYgPlmOZgo&t=194s)
2. ![](https://www.youtube.com/watch?v=ByE1RiwVH5U)
3. Used chatgpt to know what tshark will give me info for network traffic

## Requirements

The only requirement is to install tshark
``` bash
sudo apt-get install tshark
```

These are the linux distribution that tshark can be installed on:
- Alpine >= 3.9
- Debian >= 9
- FreeBSD >= 11
- OpenMandriva >= 3.0
- PCLinuxOS
- Ubuntu >= 14.04

Install wireshark-cli for the following:
- Arch Linux
- CentOS >= 8
- Fedora >= 30
- RedHat
``` bash
sudo apt-get install wireshark-cli
```

Check (https://tshark.dev/setup/install/#installing-tshark-only) for more info

## Usage

``` bash
bash netmon.sh
```

## Support

Contact me if you need any help or have any questions,
by email: a210031@students.gu.edu.lb
by phone: +961 71 386 767

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)