Dotfiles managed by [yadm](https://yadm.io/docs/overview#)
1. [Install](https://yadm.io/docs/install#)
2. Change to home directory `cd ~`
3. Get repo `yadm clone git@github.com:a-chen/dotfiles.git`
4. Use `yadm <git command>` to manage files

## alternates
Files like `.startup##os.Linux,hostname.x1carbon` are used by yadm, and symlinked to `.startup` if os and hostname matches, see https://github.com/TheLocehiliosan/yadm/blob/master/yadm.md#ALTERNATES for more info
Run `yadm alt` to manually generate sym links if not automatically created
