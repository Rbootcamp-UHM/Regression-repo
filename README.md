# HW2: Function and Regression
Function practice and exploring regression with Iris data, and more GitHub practice
## <span style="color:blue">Pull request due by Wednesday at midnight, comments due by 12 noon Thursday.</span>

# R Task 

1. Clone and create your own branch off of `Regression-repo`(instructions below if you need) and review code in
   ```
   iris_regression_stub.R  
   ```
2. Our goal in this homework is to demonstrate that *the regression line is indeed the best fitting line through the data*. One way to do that is to draw arbitrary lines through the data to show that the error is bigger. To do that develop your own regression script starting from the stub. 
    1. Start by writing down the tasks you need (you will include this in your markdown as an outline). Write code for each step, then make sure each step works. 
    2. Please read in the data from `iris.csv` (just to make sure you remember how to do this).
	3. In class we computed the regression errors as `error <- yhat - y`. Compute the sum of squared errors, save it as object `sse`.
	4. Plot the regression as in the stub, but add the `sse=` on the plot in addition to the regression slope and intercept. 
	5. After you get all of your code working, wrap it into your custom plot function that will work on any specified slope and intercept (allow users to specify slope and intercept as arguments). Feel free to pretty it up as you wish, but make sure the plot has at least the same information elements as in the stub + sse.
	6.  Demonstrate that your function works by running it on 5 arbitrary slopes and intercepts (you can make these up by any means). 
	7. Prove that you know how to write a function. Write a new function from scratch to do anything you wish and demonstrate it.

# Submission

3. Write up and push back up to GitHub:
	1. R script (.R) that contains all of your functions
	2. Rmarkdown (.Rmd) file and its web page (.html) file that documents your solution to (2.1-2.6). Be sure to document how you developed the code and how you demonstrated that the linear regression line is the best-fit line. 
	3. Rmarkdown and html files that introduces your new function (2.7) to the world. Be sure to include an example of its use.
	
4. Generate a pull request for your work on the GitHub website to complete submission.  

5. Go to your classmates submissions and provide at least 2 comments on a classmateʻs work. (See **Submission** below for step-by-step instructions)

---
# Helpful Notes on Rmarkdown and Git/GitHub
---

# Rmarkdown

[Rmarkdown basics](https://rmarkdown.rstudio.com/authoring_basics.html)

# Generating html with Rmarkdown

From within R (make sure the .Rmd file is in your R working directory): 
   ```{r}
   require(rmarkdown)
   
   render("markdown_example.Rmd", output_format="html_document") # to html
   # render("markdown_example.Rmd", output_format="word_document")  # to word doc
   # render("markdown_example.Rmd", output_format="pdf_document")  # to pdf
   # render("markdown_example.Rmd", output_format="md_document")  # to markdown
   ```

# Working with GitHub:

Cloning the repository. From your Rclass directory in your CMD or Terminal window:
   ```
    git clone https://github.com/Rbootcamp-UHM/Regression-repo.git
   ```
Check the status of your branches:
   ```
   git branch 
   ```
Making your own branch (give it your own name) and check it out (this means Git will start tracking the branch):
   ```
   git branch my-awesome-branch
   git checkout my-awesome-branch
   ```

## Pushing your new files or changes back up to the repository. 

Check status first:
   ```
   git status
   ```
You should get a message that you have changes not staged for commit on your branch. 
Add the new files on the docket to push up to your branch on github:
   ```
   git add myscript.R    
   ```
Write a commit message:
   ```
   git commit -m "Add script to do xx"
   ```
Finally push up the changes to **your own branch**. Donʻt worry it will not change the "master":
   ```
   git push origin my-awesome-branch
   ```
Every time you made edits you have to do all three:
   ```
   git add myscript.R    
   git commit -m "edits to myscript.R"
   git push origin my-awesome-branch
   ```

## If any files in your branch have been changed on the server (through the browser or someone else changed them), you will need to update your local branch before pushing your new files up to the repository:

Check the status of your branch (and confirm which one youʻre on):
   ```
   git branch 
   ```
If you have new changes on the remote my-awesome-branch and need to update your local files:
    ```
    git pull origin my-awesome-branch
    ```
Check if all is up to date:
   ```
   git status
   ```
   
If everyting is up to date it will say `Your branch is up-to-date with 'origin/master'. nothing to commit, working tree clean`

## Browsing branches

List all branches. Checkout a cool looking branch. Check which branch youʻre on:
   ```
   git branch -a
   git checkout someones-cool-branch
   git branch
   ```
To go back to your own branch, or to master:
   ```
   git checkout my-awesome-branch
   git branch
   git checkout master
   git branch
   ```


## Submission

Generate a pull request to submit your branch for review. Do this on the GitHub website.

Provide comments (at least 2) on your classmates work. Do this through the GitHub website. They have a very nice interface. 
- Click on `Pull requests` along the upper menu
- Click on one of the pull requests (branches)
- Click on `Files changed` along the second upper menu
- Highlight the rows you want to comment on
- You can checkout their branch to run the code or markdown on your own computer

[Video tutorial on how to comment on other peopleʻs code in a Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/reviewing-proposed-changes-in-a-pull-request)



