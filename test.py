from datetime import date

class Squid:

    #classvar
    species="Squid"

    def __init__(self, name, age):
        self.name = name 
        self.age = age

    @classmethod
    def change_species(cls, name):
        print(Squid.species)
        Squid.species = name
        print(Squid.species)
        print(date.today())
        return cls(name, date.today().year)


mysquid = Squid('BlueSquid',22)
test = Squid.change_species(1995)
print(test)