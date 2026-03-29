import subprocess

script = """
email_map = {
    b"kacpers@Kacpers-MacBook-Air.local": b"kacper.szymoniak2@mail.dcu.ie",
}
commit.author_email = email_map.get(commit.author_email, commit.author_email)
commit.committer_email = email_map.get(commit.committer_email, commit.committer_email)
"""

subprocess.run([
    "python", "-m", "git_filter_repo",
    "--force",
    "--commit-callback", script
])