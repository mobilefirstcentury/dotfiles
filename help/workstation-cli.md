---- workstation cli ----
========================


open stuff
---------
### open a browser
	```sh
  # this should have its proposer shortcut (we should always debug in chrome in incognito mode)
  $ opn http://sindresorhus.com -- 'google chrome' --incognito

  $ opn http://sindresorhus.com
  $ opn unicorn.png
  $ cat unicorn.png | opn
  $ echo '<h1>Unicorns!</h1>' | opn --ext=html
  $ echo '<h1>Unicorns!</h1>' | opn --ext=html --firefox 
	```
