# log4j Linux IoC Detector
A basic Bash script to detect log4j Indicator of Compromise (IoC) in Linux.

## How to Use
1. Clone this repository:
```
git clone https://github.com/santosomar/log4j-ioc-detector
```
2. Run the the `log4j_ioc_detector.sh` script, as demonstrated below:

```
# bash sudo log4j_ioc_detector.sh
A basic Bash script to detect log4j Indicator of Compromise (IoC) in Linux.
Author: Omar Santos (@santosomar)
+------------------------------------------+
Scan Started:
| Tue Dec 14 17:26:36 UTC 2021             |
Searching for exploitation attempts in uncompressed files in folder /var/log and all sub folders
Searching for  exploitation attempts in compressed files in folder /var/log and all sub folders
Searching for obfuscated variants
```

Any IoCs in the logs will be reported to the screen...
