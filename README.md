# semaine 4 jour 4 - rails et des seeds et des jointures

## use

Au lieu de faire trois repos github,
il n'y en a qu'un avec trois dossier
(c'est plus simple comme ça)

un petit `git clone https://github.com/thp-grenobles8/s04.4.viva.la.selma`

un petit `cd `dans chaque dossier, suivi d'un `bundle install`

tu peux relancer les seeds avec `rails db:seed`, de jolis **puts**
te permettrons de suivre l'avancement du seed.

après ça, joue avec les données dans la `rails console`

### free_doctor

tu remarqueras que les docteurs ont plusieurs spécialités,
mais jamais deux fois la même =)

### dogstroll

Un double lien "through" permet d'avoir tous les promeneurs d'un chien
`dog.dogsitters` et dans l'autre sens, tous les chiens promenés par un gus `dogsitter.dogs`

Seuls les chiens de la même ville que le Dogsitter peuvent rejoindre
une ballade de ce dogsitter.

## la team

- Guillaume Silvent
- Anis Bouhouche
