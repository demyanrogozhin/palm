Palm
====

A Major Emacs Mode For Typed Racket
Being A Grand Amalgamation Of
Emacs' Geiser, ECB and CEDET.

Installation
====
1. Clone the palm project.
 - Assume cloned into /tmp for the purposes of this procedure.
2. $ cd /tmp/palm
3. Geiser and ECB are setup as git submodules.
 - $ git submodule init
 - $ git submodule update
4. Install Geiser normally (see Geiser site for detailed directions). 
  - $ cd /tmp/palm/geiser
  - $ ./autogen.sh
  - $ ./configure
  - make
5. Install ECB (again see primary EDB site for details)
 - $ cd /tmp/palm/ecb
 - $ make
6. Setup your .emacs.d/init.el file (basic approach here).
 - (add-to-list 'load-path "/tmp/palm/ecb")
 - (require 'ecb)
 - (add-to-list 'load-path "/tmp/palm/elisp")
 - (require 'palm)
 - (load-file "/tmp/palm/geiser/elsip/geiser-load.el")
 - (require 'geiser-install)
7.  Edit a Racket file.  
 - $ emacs myfile.rkt
8. Something should happen.
