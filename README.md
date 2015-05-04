###Simple script to add intermediate certificates to a certificate chain

Execute the script with the following options:

```-p <path to your issued pfx file>```

```-i <path to missing intermediate cer file>```

The PFX will be converted to a cer and a key, this will prompt you for the export password if one exists.
A new PFX will be created with your issued cert, key, and the intermediate you specified.  You will be prompted
to enter a password of your choosing for the new PFX.  Your fresh, complete, cert chain in the form of a full-chain.pfx will be placed in the current directory.
