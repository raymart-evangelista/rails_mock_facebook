# README
## INFO
- This project was completed following [the final RoR project of The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)
- I came across precompiling errors when trying to deploy to heroku. I spent a lot of time (about an hour of half of trying to bugfix) googling fixes and following the messages heroku provided as well. 
  - Ultimately, the problem had to do with the way I decided to install tailwindcss from the start and using bug fixes that worked using other install methods. 
  - To get heroku working with tailwind.css, I googled "heroku tailwind css precompiling assets failed" to which I found [this thread](https://jumpstartrails.com/discussions/resolved-can-t-deploy-to-heroku-after-merging-latest-jumpstart-version) where one user stated the problem I ultimately was dealing with--Using both NPM and Yarn.
    - I deleted `package-lock.json` and `yarn.lock` then ran `yarn install` and deleted `/public/assets` and finally `git push heroku main` worked once again. 

## TO DO
- Extra credit:
  - Code refactoring for better reusability
  - Make posts also allow images
  - Use Active Storage to allow users to upload photos to their profile
  - Make post able to be either text or photo by using a polymorphic association
  - Style with html/css

## GEMS
- [devise](https://github.com/heartcombo/devise) for user authentication
- [guard](https://github.com/guard/guard) for testing
- [guard-rspec](https://github.com/guard/guard-rspec) for testing
- [tailwindcss-rails]()
- [friendly_id](https://github.com/norman/friendly_id)
- [gravtastic](https://github.com/chrislloyd/gravtastic)

## RESOURCES
- [Show a devise log in or sign up forms in another page](https://pablofernandez.tech/2016/04/26/show-a-devise-log-in-or-sign-up-forms-in-another-page/)
- [Root view for authenticated and unauthenticated users](https://stackoverflow.com/questions/43429845/how-to-have-root-view-when-user-is-not-logged-in-rails)
- [Limit access to users](https://stackoverflow.com/questions/43433717/how-to-structure-authenticated-routes-when-using-devise)
- [Add first name and last name to Devise](https://github.com/raymart-evangelista/rails_private_events)
- [Reusing Styles with tailwindcss](https://tailwindcss.com/docs/reusing-styles#extracting-classes-with-apply)
- [tailwindcss colors](https://tailwindcss.com/docs/customizing-colors)
- [Dropdown menu](https://www.youtube.com/watch?v=TQFW3AtrDw4)
- [footer](https://flowbite.com/docs/components/footer/)
- [generating unique usernames](https://stackoverflow.com/questions/9905418/generate-unique-username-omniauth-devise)
- [Order by DESC](https://www.chrisjmendez.com/2016/12/31/rails-order-by-desc/)
- [Custom routes](https://stackoverflow.com/questions/42464328/how-to-add-a-single-custom-route-in-rails)
- [Devise send email after signup](https://stackoverflow.com/questions/17479864/rails-devise-send-user-email-after-sign-up-create)