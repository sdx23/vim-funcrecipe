" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Recipe title
syntax match recipeTitle "^title:.*$" contains=recipeMetaKey
syntax match recipeMetaKey "^title:" contained

" Recipe metadata
syntax match recipeMeta "^\(servings\|tags\|url\):.*$" contains=recipeMetaKey,recipeServingsNumber
syntax match recipeMetaKey "^\(servings\|tags\|url\):" contained
syntax match recipeServingsNumber "\d\+" contained

" Section headers (captions)
syntax match recipeCaption "\S.*\n---$" contains=recipeHline
syntax match recipeHline "^---$" contained

" Ingredients (with various formats)
"syntax match recipeIngredient "^\d\+\s*\(g\|ml\|TL\|EL\)\s.*$"
"syntax match recipeIngredient "^\d\+\s\+[A-Za-zÀ-ÿ]\+\>"
" Ingredients (with various formats)
syntax match recipeIngredient "^\d\+\s*\(\|g\|ml\|TL\|EL\)\s.*$" contains=recipeIngredientAmount,recipeIngredientUnit
"syntax match recipeIngredient "^\d\+\s\+[A-Za-zÀ-ÿ]\+\>" contains=recipeIngredientAmount
syntax match recipeIngredientAmount "^\d\+" contained
syntax match recipeIngredientUnit "\(\d\+\s*\)\@<=\(g\|ml\|TL\|EL\)\>" contained

" Steps
syntax match recipeStep "^\s\+\zs[A-Z].*\.$" contains=recipeDuration,recipeTemperature

" Temperatures
syntax match recipeTemperature "\d\+°C" contains=recipeTemperatureAmount,recipeTemperatureUnit
syntax match recipeTemperatureAmount "\d\+" contained
syntax match recipeTemperatureUnit "°C" contained

" Durations
syntax match recipeDuration "\d\+\s*\(min\|h\)\>" contains=recipeDurationAmount,recipeDurationUnit
syntax match recipeDurationAmount "\d\+" contained
syntax match recipeDurationUnit "\(min\|h\)\>" contained

" Define highlight links
highlight link recipeTitle Title
highlight link recipeMeta Normal
highlight link recipeMetaKey Comment
highlight link recipeServingsNumber Number
highlight link recipeCaption Title
highlight link recipeHline Special
highlight link recipeIngredient String
highlight link recipeIngredientAmount Constant
highlight link recipeIngredientUnit Type
highlight link recipeStep Normal
highlight link recipeTemperature Number
highlight link recipeTemperatureAmount Constant
highlight link recipeTemperatureUnit Type
highlight link recipeDuration Number
highlight link recipeDurationAmount Constant
highlight link recipeDurationUnit Type

let b:current_syntax = "recipe"
