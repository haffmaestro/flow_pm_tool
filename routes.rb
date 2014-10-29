                  Prefix Verb   URI Pattern                                             Controller#Action
        new_user_session GET    /users/sign_in(.:format)                                devise/sessions#new
            user_session POST   /users/sign_in(.:format)                                devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                               devise/sessions#destroy
           user_password POST   /users/password(.:format)                               devise/passwords#create
       new_user_password GET    /users/password/new(.:format)                           devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)                          devise/passwords#edit
                         PATCH  /users/password(.:format)                               devise/passwords#update
                         PUT    /users/password(.:format)                               devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)                                 devise/registrations#cancel
       user_registration POST   /users(.:format)                                        devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)                                devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)                                   devise/registrations#edit
                         PATCH  /users(.:format)                                        devise/registrations#update
                         PUT    /users(.:format)                                        devise/registrations#update
                         DELETE /users(.:format)                                        devise/registrations#destroy
                    root GET    /                                                       home#index
                   about GET    /about(.:format)                                        home#about
           project_tasks POST   /projects/:project_id/tasks(.:format)                   tasks#create
            project_task DELETE /projects/:project_id/tasks/:id(.:format)               tasks#destroy
     project_discussions GET    /projects/:project_id/discussions(.:format)             discussions#index
                         POST   /projects/:project_id/discussions(.:format)             discussions#create
                projects GET    /projects(.:format)                                     projects#index
                         POST   /projects(.:format)                                     projects#create
             new_project GET    /projects/new(.:format)                                 projects#new
            edit_project GET    /projects/:id/edit(.:format)                            projects#edit
                 project GET    /projects/:id(.:format)                                 projects#show
                         PATCH  /projects/:id(.:format)                                 projects#update
                         PUT    /projects/:id(.:format)                                 projects#update
                         DELETE /projects/:id(.:format)                                 projects#destroy
     discussion_comments GET    /discussions/:discussion_id/comments(.:format)          comments#index
                         POST   /discussions/:discussion_id/comments(.:format)          comments#create
  new_discussion_comment GET    /discussions/:discussion_id/comments/new(.:format)      comments#new
 edit_discussion_comment GET    /discussions/:discussion_id/comments/:id/edit(.:format) comments#edit
      discussion_comment GET    /discussions/:discussion_id/comments/:id(.:format)      comments#show
                         PATCH  /discussions/:discussion_id/comments/:id(.:format)      comments#update
                         PUT    /discussions/:discussion_id/comments/:id(.:format)      comments#update
                         DELETE /discussions/:discussion_id/comments/:id(.:format)      comments#destroy
         edit_discussion GET    /discussions/:id/edit(.:format)                         discussions#edit
              discussion GET    /discussions/:id(.:format)                              discussions#show
                         DELETE /discussions/:id(.:format)                              discussions#destroy
 api_discussion_comments GET    /api/discussions/:discussion_id/comments(.:format)      api/comments#index
                         POST   /api/discussions/:discussion_id/comments(.:format)      api/comments#create
  api_discussion_comment DELETE /api/discussions/:discussion_id/comments/:id(.:format)  api/comments#destroy
       api_project_tasks GET    /api/projects/:project_id/tasks(.:format)               api/tasks#index
                         POST   /api/projects/:project_id/tasks(.:format)               api/tasks#create
        api_project_task DELETE /api/projects/:project_id/tasks/:id(.:format)           api/tasks#destroy
