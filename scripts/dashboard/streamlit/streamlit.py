import matplotlib.pyplot as plt
import pandas as pd
import streamlit as st


diamonds = pd.read_csv('../../../data/diamonds.csv',
                       dtype={'color': 'category',
                              'cut': 'category'})

st.title("Diamonds Exploratory Analysis")


# User Input
st.sidebar.title('User inputs:')

st.sidebar.write('Filter:')

slider = st.sidebar.slider('Carat:', 
                   min_value = min(diamonds['carat']),
                   max_value = max(diamonds['carat']),
                   value = [min(diamonds['carat']), max(diamonds['carat'])])

clarity_categories = st.sidebar.multiselect('Clarity:',
                                    default = diamonds['clarity'].unique(),
                                    options = diamonds['clarity'].unique())


st.sidebar.write('Plot options:')

xvar = st.sidebar.selectbox('X Variable:', 
                            options = diamonds.columns,
                            index = 1)

yvar = st.sidebar.selectbox('Y Variable:', 
                            options = diamonds.columns,
                            index = 7)

colorvar = st.sidebar.selectbox('Color Variable:', 
                            options = diamonds.columns,
                            index = 2)

logx = st.sidebar.checkbox("Log x-axis", value = False)
logy = st.sidebar.checkbox("Log y-axis", value = False)


# Filter data
d2 = diamonds[(slider[0] <= diamonds['carat']) & (diamonds['carat'] <= slider[1])] # R users note the 0-based indexing and lack of comma
d  = d2[d2['clarity'].isin(clarity_categories)]

# Construct Plot
plt.style.use('ggplot')

fig, ax = plt.subplots() # ax for marker attempt
fig = d.plot.scatter(
    x = xvar, 
    y = yvar, 
    c = colorvar,
    colormap = 'viridis')

# marker_map = {'Fair': 'o', 'Good': '+', 'Very Good': '*', 'Premium': 'p', 'Ideal': 'i'}

# for category in diamonds['cut'].unique():
#     subset = diamonds[diamonds['cut'] == category]
#     ax.scatter(
#         x = subset['x'], 
#         y = subset['y'], 
#         c = subset['color'],
#         cmap = 'viridis',
#         marker = marker_map[category], 
#         label = category)

if (logx):
    fig.set_xscale('log')

if (logy):
    fig.set_yscale('log')

plt.title('Diamonds')
plt.xlabel('Carat')
plt.ylabel('Price ($)')

st.pyplot(fig.figure)

