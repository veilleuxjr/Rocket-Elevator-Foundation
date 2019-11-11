Semaine 7
Projet de Gabriel Bibeau, Steve Drolet Toutant, Jérémie Veilleux et Miguel Martin.
Vous pouvez accéder au back-office avec le compte mathieu.houde@codeboxx.biz password : 123456

Google Maps
La section de Google Maps peut être accéder dans l'onglet account de la page d'acceuil. Vous y touverez la localisation de tous nos buildings avec de l'information pertinente, dont la méteo.
Les gems utilisés pour cet API furent Faraday et open weathers

Twilio
Un texto est envoyé au technicien responsable lorsque le status d'un ascenseur change à 'Intervention'. La modification peut être faite dans le back office.
Le gem Twilio-Ruby a été utilisé. 

Slack
Un message est envoyé dans slack lorsque le status d'un ascenseur change. La modification peut être faite dans le back office. 
Le gem slack notifier a été utilisé.

Dropboxx
Suite à un formulaire lead compléter, si ce client potentiel devient bel et bien un client, la pièce jointe qu'il a joint au formulaire se transfert de la database à un compte dropbox, dans un dossier à son nom, et s'efface ensuite de la datebase. 
Le gem dropbox_api a été utilisé.

Sendgrid
Un email de bienvenue est envoyé à tous les clients qui complètent le formulaire contact us afin de les remiercier de nous avoir contacté.
Le gem sengrid_ruby a été utilisé.

IBM Watson
Watson acceuillera les employés qui accèderont au back office en leur donnant des informations sur nos ascenseurs. Il pourrait aussi leur donner des informations essentielles sur l'univers de Star Wars. Ils n'ont qu'à raffraichir la page pour en savoir davantage. 
Le gem utilisé fut IBM_Watson.

Zendesk
Des tickets sont générés dans un compte Zendesk lorsque les formulaires contact us et get a quote sont remplis. 
Le gem zendesk_api a été utilisé. 


Le gem figaro a aussi été utilisé afin de sécuriser nos clés.




