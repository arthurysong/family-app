# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project: Used Rails to create app.
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): User has many roles. 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User): Role belongs to a User.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients): User has many families through Roles.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients): User has many families through Roles. Families have many users through Roles.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity): THe through part, Roles, contain an attribute called Title, which can be assigned by User.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item): Users must have first_name, unique email, and password.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes): Scope method exists for User to find users that are 'parents' of a specific family.
- [x] Include signup (how e.g. Devise): Users are able to create new accounts.
- [x] Include login (how e.g. Devise): Users are able to login, authentified via Bcrypt.
- [x] Include logout (how e.g. Devise): Users can log out.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth): OmniAuth Github is used for third party user authentification.
- [x] Include nested resource show or index (URL e.g. users/2/recipes): User's show page can be viewed under nested families route.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new): A new role form is viewed under nested families route.
- [x] Include form display of validation errors (form URL e.g. /recipes/new): When errors occur in updating or creating, form has red border.

Confirm:
- [x] The application is pretty DRY: I use helper methods to keep application.
- [x] Limited logic in controllers: I have methods in the models, to hide some of model/class logic in controller.
- [x] Views use helper methods if appropriate: Views incorporate helper methods.
- [x] Views use partials if appropriate: Many partials are used to displaly errors, display a families board, or to display some forms.