# Generic serializer

Library for format maps and list in response controller

## Installation

```elixir

def deps do
  [{:generic_serializer, git: "https://github.com/misterandyv/generic-serializer.git"}]
end

next update dependencies :

mix deps.get
```

## Usage

```elixir
alias  GenericSerializer

For list :
   GenericSeralizer.generic_list("here send to list")

For maps :
   GenericSeralizer.generic_map("here send to map")
```

## use it and enjoy it ....

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
