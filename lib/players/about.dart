
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 16),
            RichText(
                Text(
                  "Airis Team",
                  style: TextStyle(
                  ),
                  padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width*0.15,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "We are a Development Team dedicated to professional software "
           
            // Artx Email
            ListTile(
              onTap: () {
                launch('mailto:artx4dev@gmail.com');
              },
              leading: Icon(
                
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Product Sans',
                  color: Theme.of(context).textTheme.bodyText1.color
                )
              ),
              subtitle: Text(
                "artx4dev@gmail.com",
                style: TextStyle(
              },
              leading: Image.asset(
              
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
