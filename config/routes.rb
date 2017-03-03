Rails.application.routes.draw do
  resources :exams
  devise_for :users
  root 'welcome#index'

  get 'welcome/index'

  put 'students/set_tutor'
  put 'tutors/add_student'

  resources :affiliates
  resources :coordinators
  resources :students
  resources :tutors
  resources :tutor_comments
end
