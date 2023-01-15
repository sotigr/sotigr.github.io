# Welcome to my little note dump

In here I store notes and guides of my various hobbies, but mostly coding, computer tinkering and 3D printing 



this is a test

```go
 import (  
    "fmt"
	"net/http" 
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	dbTools "main/database" 
)
 
type DbUser struct {
	ID           primitive.ObjectID `bson:"_id"`
	FirstName    string             `bson:"firstName"`
	EmailAddress string             `bson:"emailAddress"`
}

func GetUser() gin.HandlerFunc {
	return func(c *gin.Context) {
		db := dbTools.Database()
		defer db.CancelContext()

		var user DbUser

		err := db.Current.Collection("user").FindOne(db.Context, bson.M{"emailAddress": "user@example.com"}).Decode(&user)

		if err != nil {
			fmt.Println(err)
		}

		c.JSON(http.StatusOK, user)
	}
} 
```


``` py
import tensorflow as tf
```

``` yaml
theme:
  features:
    - content.code.annotate # (1)
```

``` py linenums="1"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```
``` title=".browserslistrc"
--8<-- ".browserslistrc"
```
