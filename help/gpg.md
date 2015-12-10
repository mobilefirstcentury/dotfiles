
Quick'n easy gpg cheatsheet

If you found this page, hopefully it's what you were looking for. It's just a brief explanation of some of the command line functionality from gnu privacy guard (gpg). Please email me if you find any errors ( scout3801@gmail.com ).

Filenames are italicized (loosely, some aren't, sorry), so if you see something italicized, think "put my filename there."

I've used User Name as being the name associated with the key. Sorry that isn't very imaginative. I *think* gpg is pretty wide in it's user assignments, ie. the name for my private key is Charles Lockhart, but I can reference that by just putting in Lockhart. That doesn't make any sense, sorry.

to create a key:
gpg --gen-key
generally you can select the defaults.
to export a public key into file public.key:
gpg --export -a "User Name" > public.key
This will create a file called public.key with the ascii representation of the public key for User Name. This is a variation on:
gpg --export
which by itself is basically going to print out a bunch of crap to your screen. I recommend against doing this.
gpg --export -a "User Name"
prints out the public key for User Name to the command line, which is only semi-useful

to export a private key:
gpg --export-secret-key -a "User Name" > private.key
This will create a file called private.key with the ascii representation of the private key for User Name.
It's pretty much like exporting a public key, but you have to override some default protections. There's a note (*) at the bottom explaining why you may want to do this.

to import a public key:
gpg --import public.key
This adds the public key in the file "public.key" to your public key ring.

to import a private key:
gpg --allow-secret-key-import --import private.key
This adds the private key in the file "private.key" to your private key ring. There's a note (*) at the bottom explaining why you may want to do this.

to delete a public key (from your public key ring):
gpg --delete-key "User Name"
This removes the public key from your public key ring.
NOTE! If there is a private key on your private key ring associated with this public key, you will get an error! You must delete your private key for this key pair from your private key ring first.

to delete an private key (a key on your private key ring):
gpg --delete-secret-key "User Name"
This deletes the secret key from your secret key ring.

To list the keys in your public key ring:
gpg --list-keys

To list the keys in your secret key ring:
gpg --list-secret-keys

To generate a short list of numbers that you can use via an alternative method to verify a public key, use:
gpg --fingerprint > fingerprint
This creates the file fingerprint with your fingerprint info.

To encrypt data, use:
gpg -e -u "Sender User Name" -r "Receiver User Name" somefile
There are some useful options here, such as -u to specify the secret key to be used, and -r to specify the public key of the recipient.
As an example: gpg -e -u "Charles Lockhart" -r "A Friend" mydata.tar
This should create a file called "mydata.tar.gpg" that contains the encrypted data. I think you specify the senders username so that the recipient can verify that the contents are from that person (using the fingerprint?).
NOTE!: mydata.tar is not removed, you end up with two files, so if you want to have only the encrypted file in existance, you probably have to delete mydata.tar yourself.
An interesting side note, I encrypted the preemptive kernel patch, a file of 55,247 bytes, and ended up with an encrypted file of 15,276 bytes.

To decrypt data, use:
gpg -d mydata.tar.gpg
If you have multiple secret keys, it'll choose the correct one, or output an error if the correct one doesn't exist. You'll be prompted to enter your passphrase. Afterwards there will exist the file "mydata.tar", and the encrypted "original," mydata.tar.gpg.
NOTE: when I originally wrote this cheat sheet, that's how it worked on my system, however it looks now like "gpg -d mydata.tar.gpg" dumps the file contents to standard output. The working alternative (worked on my system, anyway) would be to use "gpg -o outputfile -d encryptedfile.gpg", or using mydata.tar.gpg as an example, I'd run "gpg -o mydata.tar -d mydata.tar.gpg". Alternatively you could run something like "gpg -d mydata.tar.gpg > mydata.tar" and just push the output into a file. Seemed to work either way.

Ok, so what if you're a paranoid bastard and want to encrypt some of your own files, so nobody can break into your computer and get them? Simply encrypt them using yourself as the recipient.
I haven't used the commands:
gpg --edit-key
gpg --gen-revoke
--gen-revoke creates a revocation certificate, which when distributed to people and keyservers tells them that your key is no longer valid, see http://www.gnupg.org/gph/en/manual/r721.html
--edit-key allows you do do an assortment of key tasks, see http://www.gnupg.org/gph/en/manual/r899.html

Sharing Secret Keys

NOTE!: the following use cases indicate why the secret-key import/export commands exist, or at least a couple ideas of what you could do with them. HOWEVER, there's some logistics required for sharing that secret-key. How do you get it from one computer to another? I guess encrypting it and sending it by email would probably be ok, but I wouldn't send it unencrypted with email, that'd be DANGEROUS.
Use Case *.1 : Mentioned above were the commands for exporting and importing secret keys, and I want to explain one reason of why maybe you'd want to do this. Basically if you want one key-pair for all of your computers (assuming you have multiple computers), then this allows you export that key-pair from the original computer and import it to your other computers. 

Use Case *.2 : Mentioned above were the commands for exporting and importing secret keys, and I want to explain one reason of why maybe you'd want to do this. Basically, if you belonged to a group, and wanted to create a single key-pair for that group, one person would create the key-pair, then export the public and private keys, give them to the other members of the group, and they would all import that key-pair. Then a member of the group or someone outside could use the group public key, encrypt the message and/or data, and send it to members of the group, and all of them would be able to access the message and/or data. Basically you could create a simplified system where only one public key was needed to send encrypted stuffs to muliple recipients.

----------------------------------------------------------------------------------------------------------------------------------------------------------------
GnuPG stands for GNU Privacy Guard.

GnuPG is an open implementation of OpenPGP ( Pretty Good Privacy ) standard as defined in RFC 4880. In this article we will cover the installation and the basics of generating keys using gnupg.

This article is part of our ongoing series on Cryptography. If you are new to cryptography, refer to our earlier article on Introduction to Cryptography.

On Debian based systems, use the following command to install GnuPg tool.

# apt-get install gnupg
The first step to use GnuPg is to create the public and private key pairs. The following command is used to create the keys.

$ gpg --gen-key
The above command will act in Interactive mode. The following explains various input that needs to be given to the above gpg command.

1. Choose the algorithm to be used for key generation

gpg: directory `/home/lakshmanan/.gnupg' created
gpg: new configuration file `/home/lakshmanan/.gnupg/gpg.conf' created
gpg: WARNING: options in `/home/lakshmanan/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/home/lakshmanan/.gnupg/secring.gpg' created
gpg: keyring `/home/lakshmanan/.gnupg/pubring.gpg' created
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)

Your selection?
Each algorithm has its own advantages and disadvantages. Choose the one you prefer, or use the default RSA algorithm. Press 1 or Enter.

2. Select the key size

Once the algorithm is selected, it will ask for the key size.

RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048)
In general, bigger the key size, the more secure it is. Practically 2048 should be sufficient. Type your key size or press Enter to accept the default.

3. Key validity

The next input we need to provide is how long does the key is valid.

Requested keysize is 2048 bits
Please specify how long the key should be valid.
         0 = key does not expire
        = key expires in n days
      w = key expires in n weeks
      m = key expires in n months
      y = key expires in n years
Key is valid for? (0)
Type 0 if you don’t want the key to expire.

It will again ask for a confirmation. Press Y

Key does not expire at all
Is this correct? (y/N) y
4. Create User ID and Password

Each key will be mapped with a user id and password. Now it asks for your name, E-Mail and passphrase

You need a user ID to identify your key; the software constructs the user ID
from the Real Name, Comment and Email Address in this form:
    "Heinrich Heine (Der Dichter) "

Real name: lakshmanan
Email address: admin@thegeekstuff.com
Comment: My test GPG keys
You selected this USER-ID:
    "lakshmanan (My test GPG keys) "

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
You need a Passphrase to protect your secret key.

Enter Passphrase
5. Final Output Keys

In-order to generate a unique key, the system needs more random bytes. So perform some operations which access the disk, network etc…, so that the system will get enough random bytes.

We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

Not enough random bytes available.  Please do some other work to give
the OS a chance to collect more entropy! (Need 39 more bytes)
+++++
+++++
Once sufficient random bytes is available, the keys will be generated.

gpg: /home/lakshmanan/.gnupg/trustdb.gpg: trustdb created
gpg: key A7344E7D marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   2048R/A7344E7D 2012-10-12
      Key fingerprint = 3AE0 7948 C880 E5F7 F0A1  E16A 6EBB 3931 A734 4E7D
uid                  lakshmanan (My test GPG keys)
sub   2048R/96F8EF9B 2012-10-12
Now we have generated the key pairs to use with GnuPg. The above output provides some important information such as

Key-ID A7344E7D

We will be using this Key-Id for doing various operations as we will see later.

6. List the Key Pairs

You can list the key’s that got generated using –list-keys and –list-secret-keys option

$ gpg --list-keys
/home/lakshmanan/.gnupg/pubring.gpg
-----------------------------------
pub   2048R/A7344E7D 2012-10-12
uid                  lakshmanan (My test GPG keys)
sub   2048R/96F8EF9B 2012-10-12

$ gpg --list-secret-keys
/home/lakshmanan/.gnupg/secring.gpg
-----------------------------------
sec   2048R/A7344E7D 2012-10-12
uid                  lakshmanan (My test GPG keys)
ssb   2048R/96F8EF9B 2012-10-12
7. Export Your Public Keys

Now we have generated a key pair. The next step is to publish your public key in internet ( Key Servers ), so that other person can use that public key to send message to you.

$ gpg --armor --export --output lakshmanan_pubkey.gpg lakshmanan
Now the file ‘lakshmanan_pubkey.gpg’ will have my public key. You can also use your Key-Id or Mail address as argument to this command.

$ gpg --armor --export --output lakshmanan_pubkey.gpg A7344E7D

or

$ gpg --armor --export --output lakshmanan_pubkey.gpg admin@thegeekstuff.com
Now you can send the file to the people you converse with.

8. Submit Keys to a Key-Server

Exporting your public key and sending it to individuals will be cumbersome, if you converse with many person. In that case, you can upload your public key to a server name “Key-Sever”. So people who want your key can get that from the key server.

$ gpg --send-keys --keyserver keyserver.ubuntu.com A7344E7D
Now you should have some basic understanding of GnuPG. In the future article of this series, we will explain how to encrypt, decrypt and digitally sign your messages using GnuPG.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
How to Encrypt and Decrypt a File using GnuPG in Linux
by LAKSHMANAN GANAPATHY on FEBRUARY 6, 2013
 

Using GnuPG gpg command you can generate public and private keys. In this tutorial, we will use the keys generated by gpg command to send and receive encrypted files, and digitally sign a file.

Encrypt a file and send it to your Friend

1. Import your friend’s public key

When you want to send a secret file to your friend, the first thing to do is to import your friend’s public key. You can import your friends public key from a “Key server” if he/she has exported their public key to a key server.

Refer to the “Export Your Public Keys” section in our GnuPG Basics article to understand how to export your public key to a key server.

To import public key from a key server, do the following. You can import by using any one of the above methods. Provide your friend’s Key-ID or E-Mail ID or Real Name to import the keys correctly.

$ gpg --search-keys --keyserver keyserver.ubuntu.com 'KEY-ID'

or

$ gpg --search-keys --keyserver keyserver.ubuntu.com 'E-Mail ID'

or

$ gpg --search-keys --keyserver keyserver.ubuntu.com 'Real Name'
To import public key from a file, do the following. If your friend has E-Mailed you his/her public key, then you can import those keys by using the following command

$ gpg --import myfriends_pub_key.gpg
2. Verify the imported key server

You can verify whether you have successfully imported your friend’s public key using –list-keys option

$ gpg --list-keys

/home/lakshmanan/.gnupg/pubring.gpg
-----------------------------------
pub   2048R/A7344E7D 2012-10-12
uid                  lakshmanan (My test GPG keys)
sub   2048R/96F8EF9B 2012-10-12

pub   2048R/FB2744A8 2012-12-03
uid                  raman (Ram's test ID)
sub   2048R/88EF55EE 2012-12-03
Now I’ve my friend Raman’s public key imported.

3. Encryp a secret file using your friend’s public key

Now that you have the public key of your friend, you can send him a file, which is encrypted using “Your Friend’s Public Key”, so only your friend ( Who is having the private key ), can decrypt it.

$ gpg --encrypt --recipient raman a.txt

gpg: 88EF55EE: There is no assurance this key belongs to the named user

pub  2048R/88EF55EE 2012-12-03 raman (Ram's test ID)
 Primary key fingerprint: FF32 7764 A0AE 1E85 AC4B  CF17 8AED B292 FB27 44A8
      Subkey fingerprint: D6A5 7107 77C8 6845 2F86  765C EEED DD85 88EF 55EE

It is NOT certain that the key belongs to the person named
in the user ID.  If you *really* know what you are doing,
you may answer the next question with yes.

Use this key anyway? (y/N) y
Note that there is a warning, which says, there is no guarantee that the “Public Key” belongs to your friend. We will look back at this when time permits. As of now, since I trust my fried, I’ve given “Yes” to use the key.

It will create a file named “a.txt.pgp”, when opened using editor, it will have some binary data. Send this file to your friend by any means.

If you don’t want to send a binary content, or there are issues in sending binary, you can use the –armor option which creates an ASCII file as shown below.

$ gpg --encrypt --armor --recipient raman a.txt
Decrypt a file

Now your friend would have received your encrypted file. In order to view the content of the file, he need to decrypt the file. Since decrypt operation will be performed by using your friend’s private key, it will ask for the passphrase provided by your friend while creating keys.

$ gpg --decrypt a.txt.gpg > secret.txt
Now the file secret.txt will contain the actual text written.

Send an encrypted file to multiple recipient

You can also send a file to multiple recipients by using the –recipient or -r

$ gpg -r raman -r steve -r gopi --encrypt a.txt
Once the above command is given, gpg will use the public key of all the recipients to encrypt the data in such a way that any one of their private keys can decrypt the data.

In our next article in this series, we will explain how to sign the message with data and timestamp on it.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
How to Digitally Sign a File in Linux using GnuPg (Digital Signatures)
by LAKSHMANAN GANAPATHY on APRIL 1, 2013
 

As many organizations move away from paper documents to digital documents, digital signatures are required to manage any sensitive digital documents. Digital signatures can be used to authenticate the source of the message, such that the receiver can decide whether to trust the sender or not. Now-a-days it is most widely used for software distribution and financial transactions.

In public key cryptography, it is possible to use a private key to sign a file. Anyone who has the corresponding public key can check whether the file was signed by the private key. Anyone who doesn’t have the private key cannot forge such a signature.

Digital signatures can be used for sender authentication and non-repudiation. The signer can’t claim that they didn’t sign the document.

Now-a-days, digital signatures plays a key role in software distribution. When you install any software from debian mirror, once the software is downloaded, it will verify whether the software is from a trusted source by verifying the signature, thus ensuring that the package is from a trusted source.

Now, we will see the various methods to sign documents using GnuPG tool.

If you are new to GnuPG tool, you should first understand how to use the basic gpg commands.

A digital signature, certifies and timestamps a document. If the document is altered in any way, a verification of the signature will fail.

1. Create digital signature for a file

To digitally sign a document –sign option is used. You will be asked to enter your passphrase to unlock the private key which is used for signing the document.

$ gpg --sign file.txt

You need a passphrase to unlock the secret key for
user: "lakshmanan (This is lakshmans key) "
2048-bit RSA key, ID 3630F8D6, created 2012-12-30

Enter passphrase:
Now it will create a file named “file.txt.gpg” in binary format. The input file is compressed before signing the file.

2. Verify digital signature

Given a signed document, you can verify the signature using –verify option.

$ gpg --verify file.txt.gpg

gpg: Signature made Saturday 12 January 2013 11:17:46 PM IST using RSA key ID 3630F8D6
gpg: Good signature from "lakshmanan (This is lakshmans key) "
The above command verifies that the signature made is good.

3. Extract the document from the file

To extract the original document from the signed file, use –decrypt option. You can use the –output to specify the output file to store the actual file contents.

$ gpg --output doc.txt --decrypt file.txt.gpg

gpg: Signature made Saturday 12 January 2013 11:17:46 PM IST using RSA key ID 3630F8D6
gpg: Good signature from "lakshmanan (This is lakshmans key) "
Now the actual document will be saved in doc.txt file.

4. To clear sign the documents

A common use of digital signatures is to send E-Mails. In such a case, it is not desirable to compress the file in binary and sign it. You can use –clearsign option to make the file wrapped within ASCII armored signatures.

$ gpg --output file.sig --clearsign file.txt
Now a ASCII file named file.sig will be created which contains the digital signature and the file itself.

$ cat file.sig

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This is a test file
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJQ8af1AAoJEHUf3BE2MPjWJ6QIAIoM7vZlvVD4PR4TgqKkUAr5
S4Pc/7tjkEquBcPfzHgm6MPdTd7kIvUzwHNkkST0FyB2cLzvx8wNf7Zp/kDYL0Uz
/7UCocMPsDBYHasUY4XRfCDUkF0ER/NAFdiL9AUTvQf6oQxwuQG9sWxb6tcK8eiV
U7BBvQvMl6RszP+e7VXgcDbNeYMrTDwrivP9BKwAFuBtZmRg0vQKnjenUyVJL6gJ
tndkwtOd1XGpc5ZKCTRSKOoTonuUQAD1q0Pi6nmeaNskSqwVOxzQcV6lQ8nHJTh2
XfKSAopNriv405YfC1KO5H2Ffzee2jx+o3HqxfU1vQbHtP7uf4QqxUc2HtDnRNQ=
=PN+K
-----END PGP SIGNATURE-----
Verifying the clear signed document is similar to verifying the binary signed document.

5. Create detached signature

In case of detached signatures, a new file is created as signature. You can use –detach-sign option to create a detached signature.

$ gpg --armor --detach-sig file.txt
Now a ASCII file named file.txt.asc will be created which contains the detached signature. You can using –output to change the detached signature file name.

6. Verify the detached signature

In order to verify a detached signature, you need to have both the signature file and the data file.

$ gpg --verify file.txt.asc file.txt

gpg: Signature made Sunday 13 January 2013 12:13:59 AM IST using RSA key ID 3630F8D6
gpg: Good signature from "lakshmanan (This is lakshmans key) "
Let’s try editing the file.txt. Add some content to the file.txt and try verifying the signature.

$ echo "Append" >> file.txt

$ gpg --verify file.txt.asc file.txt
gpg: Signature made Sunday 13 January 2013 12:13:59 AM IST using RSA key ID 3630F8D6
gpg: BAD signature from "lakshmanan (This is lakshmans key) "
Now the verification got failed saying BAD signature since the content is modified.

7. Encrypt and Sign a document

In one of our previous post, we also discussed in detail about how to encrypt and decrypt a file using GnuPG. But, if you want to encrypt and sign a document at the same time, do the following:

$ gpg --sign --encrypt --recipient raman file.txt
The above command encrypts the file.txt and sign the document digitally. The recipient can verify the signature and decrypt the document using –decrypt option.
-----------------------------------------------------------------------------------------------------------------------------------------------------------
How To Use GPG to Encrypt and Sign Messages on an Ubuntu 12.04 VPS
Introduction
GPG, or GNU Privacy Guard, is a public key cryptography implementation. This allows for the secure transmission of information between parties and can be used to verify that the origin of a message is genuine.

In this guide, we will discuss how GPG works and how to implement it. We will be using an Ubuntu 12.04 VPS for this demonstration, but the tools are available on any modern Linux distribution.

How Public Key Encryption Works
A problem that many users face is how to communicate securely and validate the identity of the party they are talking to. Many schemes that attempt to answer this question require, at least at some point, the transfer of a password or other identifying credentials, over an insecure medium.

Ensure That Only the Intended Party Can Read
To get around this issue, GPG relies on a security concept known as public key encryption. The idea is that you can split the encrypting and decrypting stages of the transmission into two separate pieces. That way, you can freely distribute the encrypting portion, as long as you secure the decrypting portion.

This would allow for a one-way message transfer that can be created and encrypted by anyone, but only be decrypted by the designated user (the one with the private decrypting key). If both of the parties create public/private key pairs and give each other their public encrypting keys, they can both encrypt messages to each other.

So in this scenario, each party has their own private key and the other user's public key.

Validate the Identity of the Sender
Another benefit of this system is that the sender of a message can "sign" the message with their private key. The public key that the receiver has can be used to verify that the signature is actually being sent by the indicated user.

This can prevent a third-party from "spoofing" the identity of someone. It also helps to ensure that the message was transmitted in-full, without damage or file corruption.

Set Up GPG Keys
GPG should be installed by default on Ubuntu 12.04. If it is not, you can install it with:

sudo apt-get install gnupg
To begin using GPG to encrypt your communications, you need to create a key pair. You can do this by issuing the following command:

gpg --gen-key
This will take you through a few questions that will configure your keys.

Please select what kind of key you want: (1) RSA and RSA (default)

What keysize do you want? 4096

Key is valid for? 0

Is this correct? y

Real name: your real name here

Email address: your_email@address.com

Comment: Optional comment that will be visible in your signature

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O

Enter passphrase: Enter a secure passphrase here (upper & lower case, digits, symbols)

At this point, it will need to generate the keys using entropy. This is basically a term to describe the amount of unpredictability that exists in a system. GPG uses this entropy to generate a random set of keys.

It is best to open a new terminal and ssh into the VPS while this runs. Install some software, do some work, and just use the machine as much as possible to let it generate the needed entropy.

This process may take a long time, depending on how active you can make your system. There is an article here about how to generate additional entropy with haveged, which may be of use.

Create a Revocation Certificate
You need to have a way of invalidating your key pair in case there is a security breach, or in case you lose your secret key. There is an easy way of doing this with the GPG software.

This should be done as soon as you make the key pair, not when you need it. This revocation key must be generated ahead of time and kept in a secure, separate location in case your computer is compromised or inoperable. Type:

gpg --gen-revoke your_email@address.com
You will be asked for the reason that it is being revoked. You can choose any of the available options, but since this is being done ahead of time, you won't have the specifics.

You will then be offered to supply a comment and finally, to confirm the selections.

Afterwards, a revocation certificate will be generated to the screen. Copy and paste this to a secure location, or print it for later use:

Revocation certificate created.

Please move it to a medium which you can hide away; if Mallory gets
access to this certificate he can use it to make your key unusable.
It is smart to print this certificate and store it away, just in case
your media become unreadable.  But have some caution:  The print system of
your machine might store the data and make it available to others!
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: A revocation certificate should follow

iQIfBCABAgAJBQJSTxNSAh0AAAoJEIKHahUxGx+E15EP/1BL2pCTqSG9IYbz4CMN
bCW9HgeNpb24BK9u6fAuyH8aieLVD7It80LnSg/+PgG9t4KlzUky5sOoo54Qc3rD
H+JClu4oaRpq25vWd7+Vb2oOwwd/27Y1KRt6TODwK61z20XkGPU2NJ/ATPn9yIR9
4B10QxqqQSpQeB7rr2+Ahsyl5jefswwXmduDziZlZqf+g4lv8lZlJ8C3+GKv06fB
FJwE6XO4Y69LNAeL+tzSE9y5lARKVMfqor/wS7lNBdFzo3BE0w68HN6iD+nDbo8r
xCdQ9E2ui9os/5yf9Y3Uzky1GTLmBhTqPnl8AOyHHLTqqOT47arpwRXXDeNd4B7C
DiE0p1yevG6uZGfhVAkisNfi4VrprTx73NGwyahCc3gO/5e2GnKokCde/NhOknci
Wl4oSL/7a3Wx8h/XKeNvkiurInuZugFnZVKbW5kvIbHDWJOanEQnLJp3Q2tvebrr
BBHyiVeQiEwOpFRvBuZW3znifoGrIc7KMmuEUPvA243xFcRTO3G1D1X9B3TTSlc/
o8jOlv6y2pcdBfp4aUkFtunE4GfXmIfCF5Vn3TkCyBV/Y2aW/fpA3Y+nUy5hPhSt
tprTYmxyjzSvaIw5tjsgylMZ48+qp/Awe34UWL9AWk3DvmydAerAxLdiK/80KJp0
88qdrRRgEuw3qfBJbNZ7oM/o
=isbs
-----END PGP PUBLIC KEY BLOCK-----
How To Import Other Users' Public Keys
GPG would be pretty useless if you could not accept other public keys from people you wished to communicate with.

You can import someone's public key in a variety of ways. If you've obtained a public key from someone in a text file, GPG can import it with the following command:

gpg --import name_of_pub_key_file
There is also the possibility that the person you are wishing to communicate with has uploaded their key to a public key server. These key servers are used to house people's public keys from all over the world.

A popular key server that syncs its information with a variety of other servers is the MIT public key server. You can search for people by their name or email address by going here in your web browser:

http://pgp.mit.edu/
You can also search the key server from within GPG by typing the following:

gpg --keyserver pgp.mit.edu  --search-keys search_parameters
How To Verify and Sign Keys
While you can freely distribute your generated public key file and people can use this to contact you in an encrypted way, there is still an issue of trust in the initial public key transmission.

Verify the Other Person's Identity
How do you know that the person giving you the public key is who they say they are? In some cases, this may be simple. You may be sitting right next to the person with your laptops both open and exchanging keys. This should be a pretty secure way of identifying that you are receiving the correct, legitimate key.

But there are many other circumstances where such personal contact is not possible. You may not know the other party personally, or you may be separated by physical distance. If you never want to communicate over insecure channels, verification of the public key could be problematic.

Luckily, instead of verifying the entire public keys of both parties, you can simply compare the "fingerprint" derived from these keys. This will give you a reasonable assurance that you both are using the same public key information.

You can get the fingerprint of a public key by typing:

gpg --fingerprint your_email@address.com
pub   4096R/311B1F84 2013-10-04
      Key fingerprint = CB9E C70F 2421 AF06 7D72  F980 8287 6A15 311B 1F84
uid                  Test User <test.user@address.com>
sub   4096R/8822A56A 2013-10-04
This will produce a much more manageable string of numbers to compare. You can compare this string with the person themselves, or someone else who has access to that person.

Sign Their Key
Signing a key tells your software that you trust the key that you have been provided with and that you have verified that it is associated with the person in question.

To sign a key that you've imported, simply type:

gpg --sign-key email@example.com
After you've signed the key, it means you verify that you trust the person is who he/she claims to be. This can help other people decide whether to trust that person too. If someone trusts you, and they see that you've signed this person's key, they may be more likely to trust their identity too.

You should allow the person whose key you are signing the advantages of your trusted relationship by sending them back the signed key. You can do this by typing:

gpg --export --armor email@example.com
You'll have to type in your passphrase again. Afterwards, their public key, signed by you, will be spit out on the screen. Send them this, so that they can benefit from gaining your "stamp of approval" when interacting with others.

When they receive this new, signed key, they can import it, adding on the signing information you've generated, into their GPG database. They can do this by typing:

gpg --import file_name
How To Make Your Public Key Highly Available
There is not really anything malicious that can happen if unknown people have your public key.

Because of this, it may be beneficial to make your public key easily available. People can then easily find your information to send you secure messages, from the very first communication.

You can send anyone your public key by requesting it from the GPG system:

gpg --armor --export your_email@address.com
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)

mQINBFJPCuABEACiog/sInjg0O2SqgmG1T8n9FroSTdN74uGsRMHHAOuAmGLsTse
9oxeLQpN+r75Ko39RVE88dRcW710fPY0+fjSXBKhpN+raRMUKJp4AX9BJd00YA/4
EpD+8cDK4DuLlLdn1x0q41VUsznXrnMpQedRmAL9f9bL6pbLTJhaKeorTokTvdn6
5VT3pb2o+jr6NETaUxd99ZG/osPar9tNThVLIIzG1nDabcTFbMB+w7wOJuhXyTLQ
JBU9xmavTM71PfV6Pkh4j1pfWImXc1D8dS+jcvKeXInBfm2XZsfOCesk12YnK3Nc
u1Xe1lxzSt7Cegum4S/YuxmYoh462oGZ7FA4Cr2lvAPVpO9zmgQ8JITXiqYg2wB3
. . .
You can then copy and paste this or send this in an appropriate medium.

If you want to publish your key to a key server, you can do it manually through the forms available on most of the server sites.

Another option is to do this through the GPG interface.

Look up your key ID by typing:

gpg --list-keys your_email@address.com
The highlighted portion is your key ID. It is a short way to reference the key to the internal software.

pub   4096R/311B1F84 2013-10-04
uid                  Test User <test.user@address.com>
sub   4096R/8822A56A 2013-10-04
To upload your key to a certain key server, you can then use this syntax:

gpg --send-keys --keyserver pgp.mit.edu key_id
Encrypt and Decrypt Messages with GPG
You can easily encrypt and decrypt messages after you have configured your keys with the other party.

Encrypt Messages
You can encrypt messages using the "--encrypt" flag for GPG. The basic syntax would be:

gpg --encrypt --sign --armor -r person@email.com name_of_file
The parameters basically encrypt the email, sign it with your private key to guarantee that it is coming from you, and generates the message in a text format instead of raw bytes.

You should also include a second "-r" recipient with your own email address if you want to be able to read the message ever. This is because the message will be encrypted with each person's public key, and will only be able to be decrypted with the associated private key.

So if it was only encrypted with the other party's public key, you would not be able to view the message again, unless you somehow obtained their private key. Adding yourself as a second recipient encrypts the message two separate times, one for each recipient.

Decrypt Messages
When you receive a message, simply call GPG on the message file:

gpg file_name
The software will prompt you as necessary.

If you have the message as a raw text stream, you can copy and paste it after you just typing gpg without any arguments. You can press "CTRL-D" to signify the end of the message and GPG will decrypt it for you.

Key Maintenance
There are a number of procedures that you may need to use on a regular basis to manage your key database.

To list your available GPG keys that you have from other people, you can issue this command:

gpg --list-keys
Your key information can become outdated if you are relying on information pulled from public key servers. You do not want to be relying on revoked keys, because that would mean you are trusting potentially compromised keys.

You can update the key information by issuing:

gpg --refresh-keys
This will fetch new information from the key servers.

You can pull information from a specific key server by using:

gpg --keyserver key_server --refresh-keys
Conclusion
Using GPG correctly can help you secure your communications with different people. This is extremely helpful, especially when dealing with sensitive information, but also when dealing with regular, every day messaging.

Because of the way that certain encrypted communications can be flagged by monitoring programs, it is recommended to use encryption for everything, not just "secret" data. That will make it more difficult for people to know when you are sending important data or just sending a friendly hello.

GPG encryption is only useful when both parties use good security practices and are vigilant about their other security practices. Educate those who you communicate regularly with about the importance of these practices if you want to have the possibility of cryptographically secure communication.

By Justin Ellingwood Tagged In: Email, Security, Linux Basics, Miscellaneous, Ubuntu
jellingwood
Written By:
Justin Ellingwood
Do you find this post helpful?
Show the author by Hearting it!
Related Tutorials
How To Create an Ansible Playbook To Automate Drupal Installation on Ubuntu 14.04
Como Instalar e Utilizar o Docker: Primeiros passos
How To Install and Configure OSSEC Security Notifications on Ubuntu 14.04
How To Install SchoolTool Student Information System on Ubuntu 14.04
Recovering Files from a Compromised Droplet Using the Recovery ISO
9 Comments
You must be logged in to comment. Log In
BIULOLLinkCodeHighlightTable

 Notify me of replies to my comment SUBMIT COMMENT 
 didaspilja
didaspilja April 1, 2014
Thanks for this useful text. Something that I believe is missing and still bother me is how to import my personal key from WinXP (PGP8.0) to Ubuntu and make it as "primary" (not something that belongs to other people) 
 kamaln7
kamaln7MOD April 1, 2014
@didaspilja: You can import a private key by running
gpg --allow-secret-key-import --import /path/to/key
You don't need the public key as gpg can extract it from the private key.