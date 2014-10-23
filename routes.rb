                 Prefix Verb   URI Pattern                                          Controller#Action
                   root GET    /                                                    projects#index
                  about GET    /about(.:format)                                     home#about
          project_tasks POST   /projects/:project_id/tasks(.:format)                tasks#create
           project_task DELETE /projects/:project_id/tasks/:id(.:format)            tasks#destroy
    project_discussions GET    /projects/:project_id/discussions(.:format)          discussions#index
                        POST   /projects/:project_id/discussions(.:format)          discussions#create
 new_project_discussion GET    /projects/:project_id/discussions/new(.:format)      discussions#new
edit_project_discussion GET    /projects/:project_id/discussions/:id/edit(.:format) discussions#edit
     project_discussion GET    /projects/:project_id/discussions/:id(.:format)      discussions#show
                        PATCH  /projects/:project_id/discussions/:id(.:format)      discussions#update
                        PUT    /projects/:project_id/discussions/:id(.:format)      discussions#update
                        DELETE /projects/:project_id/discussions/:id(.:format)      discussions#destroy
               projects GET    /projects(.:format)                                  projects#index
                        POST   /projects(.:format)                                  projects#create
            new_project GET    /projects/new(.:format)                              projects#new
           edit_project GET    /projects/:id/edit(.:format)                         projects#edit
                project GET    /projects/:id(.:format)                              projects#show
                        PATCH  /projects/:id(.:format)                              projects#update
                        PUT    /projects/:id(.:format)                              projects#update
                        DELETE /projects/:id(.:format)                              projects#destroy
                  tasks GET    /tasks(.:format)                                     tasks#index
                   task GET    /tasks/:id(.:format)                                 tasks#show
