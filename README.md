# Personnel Setup

1. Go to the following repositories and click **Fork** in the top-right corner to create your own forks
    1. [29th/personnel-api](https://github.com/29th/personnel-api)
    2. [29th/personnel-app](https://github.com/29th/personnel-app)
    3. [29th/vanilla](https://github.com/29th/vanilla)
2. Create an account on [Cloud 9](http://c9.io) using GitHub to authenticate (or create a new login and authenticate with GitHub on the dashb0ard)
3. Click **Create new workspace** and select **Clone from URL**. When it's finished, select it and click **Start Editing** to open the workspace
4. Use the clone URL found on the right-hand side of this repository and click **Create**
5. Using the terminal at the bottom of the workspace, run the following command, replacing `YOUR_GITHUB_USERNAME` with your GitHub username:
```bash
source install.sh YOUR_GITHUB_USERNAME
```
6. When the installation finishes, you'll get an **Installation complete!** message with a URL to navigate to. Copy that into a new browser tab to navigate to it. (Note: If you get an SSL error, remove `:80` from the URL)
7. On the Vanilla installer, change the **Database Host** from `localhost` to `0.0.0.0` and pick an admin email, username, and password at the bottom
8. For some reason you're taken back to the Vanilla installer after clicking Continue, as if it didn't work. **Don't** fill it out a second time. Unless there's a database connection error or something, continue on.
9. Navigate to the **Installation complete!** URL again to verify you're logged in. You should see an empty, functioning forum with the 29th theme
10. Navigate to `https://<your site url>/repositories/personnel-app/dist` to view the application. You should be logged in as **Pvt. Tester** in the top-right corner.

If you'd like to use the latest data from the production 29th site (and you have access to that), you can follow [this tutorial](https://gist.github.com/wilson29thid/d07f3ca1ed0329910a27) afterwards.