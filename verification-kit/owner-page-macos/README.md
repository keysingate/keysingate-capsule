# Keysingate owner page: a macOS check (10 minutes, no installs)

**What this is.** Keysingate keeps a capsule's secret key in two halves. A person who owns a capsule
uses one small web page, `ksg-owner.html`, to open their half and to check a capsule page offline.
The page is a single file: no server, no account, no network. It was tested on Linux in Chromium,
Firefox and WebKit. **It has not been tried on a Mac.** That is what we ask you to check.

**What you need.** A Mac with Safari (and Chrome or Firefox if you have them). Nothing to install.
All data in `files/` is made up for this test; it holds no real key or money.

## Steps
1. **Open the page.** Double-click `ksg-owner.html`. Expected: the page opens in your browser and,
   within a few seconds, shows a footer line "The module in this page (SHA-256): …" with a long hex
   number. Compare it with the second line of `SHA256SUMS` (the one ending `module-inside-the-page`):
   it must be the same. (Optional: `shasum -a 256 ksg-owner.html` must equal the first line. A page
   opened from disk shows no "whole file" line: it cannot read its own bytes. That is expected.)
2. **Open a key (test T2).** Under "Open key": choose the file `files/t2/owner.ksgbak`, paste the
   text of `files/t2/good.txt` into the password field, press **Open key**. Expected: it opens
   (takes a few seconds), the password field empties, a "connect" screen appears.
   Reload the page, then try the other texts and expect a refusal each time:
   `files/t2/typo.txt` → says it is a typo, at once; `files/t2/wrong.txt` → "does not open".
3. **Check a page offline (test T7).** In the section with "Export / Keys": Export = `files/page-1.json`,
   Keys = `files/keys.json`, identifier = the text in `files/capsule-id.txt`, Class = `light`.
   Press **Check**. Expected: **ACCEPTED**. Repeat with Export = `files/page-1-tampered.json`
   (one byte changed). Expected: **REJECTED**.

## What to send back
For each browser you tried (Safari, Chrome, Firefox): macOS version, browser version, and for steps
1, 2, 3 either "as expected" or what you saw instead (a screenshot of the page and, if it fails,
the browser's console: Safari → Develop → Show JavaScript Console). Send it as an issue in this
repository or by email to the maintainer.

## Notes
- If Safari blocks something on a local file, say so; do not change settings other than the ones
  Safari asks you about.
- The camera/QR path is not part of this check.
