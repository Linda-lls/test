# Configure Git
library(usethis)
edit_git_config()

# Initialize a Git Repository
library(usethis)
use_git()

# Create a Personal Access Token (PAT) on GitHub
library(usethis)
create_github_token()

# Store PAT to Connect RStudio and GitHUb
library(gitcreds)
gitcreds_set()

# Connect Rstudio Proj with GitHub Repo
# RStudio first
library(usethis)
use_github()
