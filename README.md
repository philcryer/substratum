# substratum
`Something that underlies or serves as a basis or foundation.` In this case it's a base bash script with built-in 'best practices' I've learned over the years; use it as a framework to build your own scripts.

## About
This is a base script with built in 'best practices' I've learned over the years. The script outputs all activity to a `logs/` directory, features debugging option you can turn on in the base variables section, and has an open `_main` fuction for you to add your functionality.

## Usage
* REVIEW script variables and modify where needed
* ADD needed utilities or commands to the `_preflight` function, the script will verify they're available and in the user's `$PATH` during each run
* ADD tasks or commands to run in the `_main` function to have the script do what you want
* DIRECT output to the `work/` directory for any artifacts, if needed
* MAKE executable `chmod +x substratum.sh`
* RUN `./substratum.sh`

## License 
```BSD 2-Clause License

Copyright (c) 2020, Phil Cryer
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

## Feedback
Feedback for and changes or improvement is always welcome, send a message or open an [Issue](https://github.com/philcryer/substratum/issues) to get started.

### Thanks / Disclaimers
* Thanks
* YMMV
* No refunds or exchanges
* Offer not valid in Tennessee. Sorry Tennessee!
