import git
import os

HALON_OFFICIAL_REPO='/ws/srivasak/official/halon'

def upd_ws(repo_loc=HALON_OFFICIAL_REPO):
   g = git.Git(repo_loc)
   r = git.Repo(repo_loc)

   origin = r.remotes.origin
   origin.pull("--rebase")


def main(repo_loc=HALON_OFFICIAL_REPO):
    print ("Updating repo at {}".format(repo_loc))
    upd_ws(repo_loc)
    print ("Updated repo at {}".format(repo_loc))


if __name__ == '__main__':
    main()
