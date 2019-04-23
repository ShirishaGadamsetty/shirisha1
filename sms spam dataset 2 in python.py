
# coding: utf-8

# In[1]:


import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)


# In[3]:


from subprocess import check_output
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')
import warnings
warnings.filterwarnings('ignore')
get_ipython().run_line_magic('config', "InlineBackend.figure_format = 'retina'")
 


# In[4]:


df = pd.read_csv("E:/DataScience/spam.csv", encoding = 'latin-1')


# In[5]:


df.head()


# In[6]:


#Drop column and name change
df = df.drop(["Unnamed: 2", "Unnamed: 3", "Unnamed: 4"], axis=1)
df = df.rename(columns={"v1":"label", "v2":"text"})
data=df


# In[7]:


data.head(3)


# In[8]:


data.label.value_counts()


# In[12]:


plt.figure(figsize = (3,3))
sns.countplot(df['label'])


# In[13]:


dic={'ham':1 , 'spam':0}
data['label']=data.label.map(dic) 


# In[14]:


data.head(3)


# In[15]:


from sklearn.model_selection import train_test_split
#X_train,X_test,y_train,y_test = train_test_split(data["text"],data["label"], test_size = 0.2, random_state = 10)
spam=data[data.label ==0]
ham=data[data.label ==1]
X_train_spam,X_test_spam,y_train_spam,y_test_spam = train_test_split(spam["text"],spam["label"], test_size = 0.2, random_state = 25)
X_train_ham,X_test_ham,y_train_ham,y_test_ham= train_test_split(ham["text"],ham["label"], test_size = 0.3, random_state = 25)


# In[16]:


fm_tn=[X_train_spam,X_train_ham]
X_train=pd.concat(fm_tn)
fm_ts=[X_test_spam,X_test_ham]
X_test=pd.concat(fm_ts)
fm_lb_tn=[y_train_spam,y_train_ham]
y_train=pd.concat(fm_lb_tn)
fm_lb_ts=[y_test_spam,y_test_ham]
y_test=pd.concat(fm_lb_ts)


# In[17]:


X_train.shape,y_train.shape,X_test.shape,y_test.shape


# In[18]:


from sklearn.feature_extraction.text import CountVectorizer
vect = CountVectorizer()


# In[19]:


vect.fit(X_train)


# In[20]:


print(vect.get_feature_names()[0:20])
print(vect.get_feature_names()[-20:])


# In[21]:


X_train_df = vect.transform(X_train)
X_test_df = vect.transform(X_test)


# In[22]:


#Visualisations
ham_words = ''
spam_words = ''
spam = data[data.label == 1]
ham = data[data.label==0]


# In[23]:


import nltk
from nltk.corpus import stopwords


# In[24]:


for val in spam.text:
    text = val.lower()
    tokens = nltk.word_tokenize(text)
    #tokens = [word for word in tokens if word not in stopwords.words('english')]
    for words in tokens:
        spam_words = spam_words + words + ' '
        
for val in ham.text:
    text = val.lower()
    tokens = nltk.word_tokenize(text)
    for words in tokens:
        ham_words = ham_words + words + ' '


# In[25]:


# Generate a word cloud image
from wordcloud import WordCloud
spam_wordcloud = WordCloud(width=600, height=400).generate(spam_words)
ham_wordcloud = WordCloud(width=600, height=400).generate(ham_words)


# In[26]:


#Spam Word cloud
plt.figure( figsize=(10,8), facecolor='k')
plt.imshow(spam_wordcloud)
plt.axis("off")
plt.tight_layout(pad=0)
plt.show()


# In[27]:


#Ham word cloud
plt.figure( figsize=(10,8), facecolor='k')
plt.imshow(ham_wordcloud)
plt.axis("off")
plt.tight_layout(pad=0)
plt.show()


# In[28]:


#Machine Learning models:
#1.Multinomial Naive Bayes Generally, Naive Bayes works well on text data. Multinomail Naive bayes is best suited for classification with discrete features.
prediction = dict()
from sklearn.naive_bayes import MultinomialNB
model = MultinomialNB()
model.fit(X_train_df,y_train)


# In[29]:


prediction["Multinomial"] = model.predict(X_test_df)


# In[30]:


from sklearn.metrics import accuracy_score,confusion_matrix,classification_report


# In[31]:


accuracy_score(y_test,prediction["Multinomial"])


# In[32]:


# logistic regression 
from sklearn.linear_model import LogisticRegression
model = LogisticRegression()
model.fit(X_train_df,y_train)
prediction["Logistic"] = model.predict(X_test_df)


# In[33]:


accuracy_score(y_test,prediction["Logistic"])


# In[34]:


# kneighbour classifier
from sklearn.neighbors import KNeighborsClassifier
model = KNeighborsClassifier(n_neighbors=5)
model.fit(X_train_df,y_train)
prediction["knn"] = model.predict(X_test_df)
accuracy_score(y_test,prediction["knn"])


# In[35]:


#random forest
from sklearn.ensemble import RandomForestClassifier
model = RandomForestClassifier()
model.fit(X_train_df,y_train)
prediction["random_forest"] = model.predict(X_test_df)
accuracy_score(y_test,prediction["random_forest"])


# In[36]:


#adaboost classifier
from sklearn.ensemble import AdaBoostClassifier
model = AdaBoostClassifier()
model.fit(X_train_df,y_train)
prediction["adaboost"] = model.predict(X_test_df)
accuracy_score(y_test,prediction["adaboost"])


# In[37]:


print(classification_report(y_test, prediction["Multinomial"], target_names = ["Ham", "Spam"]))


# In[38]:


conf_mat = confusion_matrix(y_test, prediction['Multinomial'])
conf_mat_normalized = conf_mat.astype('float') / conf_mat.sum(axis=1)[:, np.newaxis]


# In[39]:


plt.figure(figsize = (3,3))
sns.heatmap(conf_mat_normalized)
plt.ylabel('True label')
plt.xlabel('Predicted label')


# In[41]:


print(conf_mat)

