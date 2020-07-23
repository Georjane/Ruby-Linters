<h1 align="center">My-Ruby-Linters</h1>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![Github Issues](https://img.shields.io/badge/GitHub-Issues-orange)](https://github.com/Georjane/Ruby-Linters/issues)
[![GitHub2 Pull Requests](https://img.shields.io/badge/GitHub-Pull%20Requests-blue)](https://github.com/Georjane/Ruby-Linters/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)
[![Made By](https://img.shields.io/badge/Made%20By-Witah Georjane-red)](https://github.com/Georjane)
[![Twitter Follow](https://img.shields.io/twitter/follow/WittyJany?label=Follow%20Witah Georjane%20on%20Twitter&style=social)](https://twitter.com/WittyJany)

</div>
<p align="center">
  <img src="https://raw.githubusercontent.com/rubocop-hq/rubocop/master/logo/rubo-logo-horizontal.png" alt="RuboCop Logo"/>
</p>

---

## 📝 Content
<p align="center">
<a href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#builtwith">Built with</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#installing">Installing</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#styleguide">Style Guide</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#author">Author</a>
</p>


## 🧐 About <a name = "about"></a>
<h3 align="center">
This is a code linter like Rubocop that trawls through your code files and finds problems, such as methods with too many lines, code style violations, or common gotchas.</h3>

---

## 🔧 Built with<a name = "builtwith"></a>

- [Ruby](https://rubyonrails.org/)

## 🔴 Live Demo

[rubocop]()

## 🛠 Installing <a name = "installing"></a>

### Pre-requisites

- Ruby installed on local machine. Please go to [this](https://www.ruby-lang.org/en/documentation/installation/) link if you need to install it.

### Usage
Clone this repository on the command promp or console using
```
git clone https://github.com/Georjane/Ruby-Linters.git
```
```
cd Ruby-Linters
```
Type in the following command to run the linter on a test file
```
bin/rubocop
```
### Testing
Test class methods using RSpec by running the command
```
rspec
```
# Style Guide <a name = "styleguide"></a>
## 1. Department Naming

<p>Naming cops check for naming issue of your code, such as method name, constant name, file name, etc.</p>

#### - Naming/VariableName
This cop makes sure that all variables use the configured style, snake_case for their names.

```
# bad
myVar = 5

# good
my_var = 5
```

#### - Naming/MethodName
This cop makes sure that all methods use the configured style, snake_case for their names.

```
# bad
def MyMethodName
  # code
end

# good
def my_method_name
  # code
end
```
#### - Naming/ClassAndModuleCamelCase
This cop checks for class and module names with an underscore in them.
```
# bad
class My_Class
end
module My_Module
end

# good
class MyClass
end
module MyModule
end
```

## 2. Department Metrics

<p>Metrics cops deal with properties of the source code that can be measured, such as class length, method length, etc. Generally speaking, they have a configuration parameter called <b>Max</b> and when running rubocop <i>--auto-gen-config</i>, this parameter will be set to the highest value found for the inspected code. In this linter, Max value has being set to 10.</p>

#### - Metrics/BlockLength
This cop checks if the length of a block exceeds some maximum value. Comment lines can optionally be ignored.

## 3. Department Layout

<p>Layout cops inspect your code for consistent use of indentation, alignment, and white space.</p>

#### - Layout/EmptyLines
This cop checks for two or more consecutive blank lines.
```
# bad - It has two empty lines.
my_method


my_method

# good
my_method

my_method
```
## ✒️  Author <a name = "author"></a>

👤 **Witah Georjane**

- Github: [@Georjane](https://github.com/Georjane)
- Twitter: [@WittyJany](https://twitter.com/WittyJany)
- Linkedin: [@witah-georjane](https://www.linkedin.com/in/witah-georjane-74b8bb184)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Georjane/Ruby-Linters/issues).

## 👍 Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is free to use as learning purposes. For any external content (e.g. logo, images, ...), please contact the proper author and check their license of use.

