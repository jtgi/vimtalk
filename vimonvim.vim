                                                                          wow

Coding at the command line with Vim!
====================================

How many have used vim?

# Why Vim?
- Runs everywhere (your server), bindings in all your IDEs.
- Very effective for most dynamic / scripting languages and others
  that operate closely on the command line.
- The genius of modal editing. 
  - Think about how much time you spend writing code vs reading or modifying.
  - From arrow keys -> command keys -> pageup/down/left/right -> some editor specific stuff maybe
  - What about the rest of the keys?
  - What if we thought about inserting text differently from navigating text
  - Normal vs Insert vs Visual vs Visual Blocks

# Opening Vim
cd to filename
vim <filename>
vim .

# Normal Mode

Vim is text-aware. It differentiates between whitespace, symbols, words.
this makes navigating for more intuitive and useful.

challenge 0: motions

    ^
    k		    Hint:  The h key is at the left and moves left.
< h	  l >		       The l key is at the right and moves right.
    j			         The j key looks like a down arrow.
    v

h (left), j (down), k (up), l (right) - move in all directions
www - move to next word | symbol
bbb - move to prev word,
eee - move to next word,
WWW - move to next word after space
BBB - move to beginning of word before prev space
*  x - delete character under cursor
*  r<char> - replace character under cursor with <char> stay in normal mode

## Exercise: fix the Bst constructor below:
- Note difference between w and W

   public Bst left;
   public Bst right;
   public int value;

   public Bst(innt balue, Bst le ft, Bkt right) {
     this.value = value;
     this.left = left;
     this.right - right;
   }

   public Blring toString() {
     StringBuffer buff = new StringBuffer();

     if[left != null] {
       buff.append(left);
     }

     buff.append(value);

     if(right != null) {
       buff.append(right);
     }

     return buff.toString<>;
   }


## More Movements
 $ - move to end of line
 _ - move to beginning of line (up until whitespace)
 f<char> - move to next <char> in line
 t<char> - move to char before <char>
 F<char> - move to prev <char> in line
 T<char> - move to char ahead of <char> previously <- confusing
 gg - move to top of file,
 G - move to end of file
 :<line_num> - jump to line num
 } - jump to next paragraph
 { - jump to previous paragraph

## Exercise 1: Bigger movements
- Move in between functions with { or }
- Try jumping to a line number and moving to end of the line.
- Try f( to search for next '(' on a line
- Try jump to end of file then back to line 64

  public static Bst createBalancedBst(int[] arr) {
    Arrays.sort(arr);
    return createBalancedBstHelper(arr, 0, arr.length - 1);
  }

  private static Bst createBalancedBstHelper(int[] arr, int lo, int hi) {
    if(hi < lo) return null;
    int mid = (lo + hi) / 2;
    Bst left = createBalancedBstHelper(arr, lo, mid-1).
    Bst right = createBalancedBstHelper(arr, mid+1, hi);
    return new Bst(arr[mid], left, right);
  }

  public boolean isBalanced() {
    int leftHeight = (left == null) ? 0 : left.height();
    int rightHeight = (right == null) ? 0 : right.height();
    return Math.abs(left.height() - right.height()) <= 1;
  }

  public int height() {
    int leftHeight = (left == null) ? 0 : 1 + left.height();
    int rightHeight = (right == null) ? 0 : 1 + right.height();
    return Math.max(leftHeight, rightHeight);
  }

# INSERT MODE
 i - move into insert mode left of cursor
 a - move into insert mode right of cursor
 A - move into insert mode at end of line
 o - move into insert mode below current line
 O - move into insert mode above current line
 <esc> - move out of insert mode

## Exercise: Fix it
- Don't you dare use your arrow keys.
- Try searching on the line with f.

  There is txt misng this
  I could really use an exclamation point

  public static boolean isBalanced(Bst root) {
    //TODO: Doesn't compile or work, fix me.
    return height(root.left) - heightroot.right) <= 1
  }

  Exercise
  - Print `s` before calling permsHelper <- use O
  - Print `out` if s.isEmpty() <- use o

  public static Set<String> perms(String s) {
      return permsHelper(s, "", new HashSet<String>());
  }

  private static Set<String> permsHelper(String s, String out, Set<String> resultSet) {

    if(s.isEmpty()) {
      resultSet.add(out);
      return resultSet;
    }

    for(int i = 0; i < s.length(); i++) {
      String reducedStr = new StringBuilder(s).deleteCharAt(i).toString();
      permsHelper(reducedStr, out + s.charAt(i), resultSet);
    }

    return resultSet;
  }

# Delete
 dw - delete a word
 u - undo
 U - undo for the whole line
 <C-r> - redo

 Exercise: Delete - wwww, dw
 --> There are a some words fun that don't belong paper in this sentence.

 Exercise : Delete rest of this line - d$
 --> There are some fun words. I like turtles.

# What is this magic? OPERATORS AND MOTIONS!
 Okay we have some operations `d`, and a bunch of movements
 We can combine delete `d` with any motion.

 d$ - delete from current cursor position until end of line
 dw - delete up until next word
 db - delete backward until beginning of prev word
 dt<char> - delete up until character <char> on current line.
 df<char> - delete up to and incl. <char> on current line.

  //TODO: Change `buff` to `str`
  public String toString() {
    StringBuffer buff = new StringBuffer();

    if(left != null) {
      buff.append(this.left);
    }

    buff.append(this.value);

    if(right != null) {
      buff.append(this.right);
    }

    return buff.toString();
  }

 MULTIPLIERS
 What if we want to move 5 words forward?
 Format: <operator><multiplier>?<movement>
 5w <- move 5
 5j <- 5 lines down
 d5w <- Delete 5 words
 d5j <- Delete down 5 words

 What if you want to delete 5 words? prefix your command with a number
 5dw <- delete the next 5 words
 ---> This is just a line with words you can move around in.

# MORE IN NORMAL MODE: OPERATING ON LINES                                    wow
 So often we need to operate on lines, vim is excellent at this
 Double up on most operators to apply it to a line

 dd <- delete the whole line

Exercise: Delete the printlns

    public static <T> Set<Set<T>> powerSet(Set<T> set) {
        Set<Set<T>> sets = new HashSet<Set<T>>();

        if(set.isEmpty()) {
            sets.add(new HashSet<T>());
            System.out.println("got here");
            return sets;
        }

        ArrayList<T> list = new ArrayList<T>(set);
        T head = list.get(0);
        Set<T> tail = new HashSet<T>(list.subList(1, list.size()));

        for(Set<T> subset : powerSet(tail)) {
          System.out.println(subset.toString());
          System.out.println("how to recursion?");
          Set<T> newSet = new HashSet<T>(subset);
          newSet.add(head);
          sets.add(newSet);
          sets.add(subset);
        }

        //Delete this using 3 character
        for(Set<T> s : sets) {
          System.out.println(s.toString());
        }

        return sets;
    }

# The mighty PUT
- Caches your last delete, writes it on p
 p - puts last deleted or yanked thing below cursor
 P - pastes last deleted or yanked thing above cursor

 Put these in order using `p`
 -----> 1st
 -----> 3nd
 -----> 2nd

 Put these in order using `P`
 -----> 1st
 -----> 3nd
 -----> 2nd

 Of course this works with multipliers too.

  public static Tree bfs(Tree root, Tree target) {
    Queue<Tree> q = new LinkedList<Tree>();
    q.add(root);
    visitedCounter++;

    while(!q.isEmpty()) {
      Tree t = q.poll();
      t.visited = visitedCounter;

      //Swap this for loop and the if statement below
      for(Tree child : t.children) {
        if(child.visited != visitedCounter) {
          q.add(child);
        }
      }

      if(t.equals(target)) {
        return t;
      }

    }

    return null;
  }


# Yank the Operator and the ol' yank & put (aka copy/paste)
 dy - yanks word
 yy - yanks line
 y2w - yanks 2 words
 p - put below
 P - put above

## Exercise: yank and put the println after each conditional

  public Trie search(String key) {
    System.out.println("made it here");
    if(key.equals(""))
      return this;

    for(Trie c : children) {
      if(c.value.startsWith(Character.toString(key.charAt(0)))) {
        return c.search(key.substring(1));
      }
    }

    return null;
  }

# VISUAL MODE
Mostly useful for operating on large blocks of text esp. delete and yank.

Copy/Paste
v <- Enter visual mode begin creating selection
}}} <- move a few blocks downward.
y <- yank
p <- put

Fix indenting
v <- enter visual mode
}}} <- select a couple blocks
= <- auto-align all text based on filetype extension (.js, .java, etc)

Indent/Outdent
v <- enter visual mode
}}} <- select some blocks
<< <- shift to the left
>> <- shift to the right
(repeat with .)

Exercise: Move constructor functions up and small methods down.             wow

  public int numVertices() {
    return graph.size();
  }

  public boolean isDirected() {
    return isDirected;
  }

  public boolean hasEdge(Node src, Node dst) {
    if(graph.containsKey(src)) {
      System.out.println("contains key!");
      ArrayList<Edge> edges = graph.get(src);
      for(Edge e : edges) {
        System.out.println(e);
        if(e.dst.equals(dst)) {
          return true;
        }
      }
      System.out.println("did not find edge");
    }

    return false;
  }

  public ListGraph(int numNodes, boolean isDirected) {
    this.isDirected = isDirected;
    this.graph = new HashMap<Node, ArrayList<Edge>>();

    for(int i = 0; i < numNodes; i++) {
      graph.put(new Node(i), new ArrayList<Edge>());
    }
  }

  public ListGraph() {
    this.graph = new HashMap<Node, ArrayList<Edge>>();
    this.isDirected = false;
  }

Exercise: Auto-align this text (probably won't work)

   <div class="download-now row">
    <div class="col-xs-12">
      <a href="https://play.google.com/store/apps/details?id=com.faceoff.app">
        <img class="monogram" alt="Android app on Google Play"
        src="img/monogram.png" />
      </a>
      <a href="https://play.google.com/store/apps/details?id=com.faceoff.app">
        <img alt="Android app on Google Play"
        src="https://developer.android.com/images/brand/en_app_rgb_wo_45.png" />
      </a>
    </div>
  </div><!-- close row-->


# Visual Block Mode (Multiline editing)

<C-v> <- (ctrl-v) Enter visual block mode
<move_around>
delete, yank, replace, whatever.
I <- begin multiline edit
typetypetype
<esc> <- copy out changes to all lines

Exercise: Go into visual block mode and move around.
Exercise: Comment out the Object.keys... block: <C-v>}I//<esc>
Exercise: add '.parent' before appendChild
Excercise: actually delete '.parent' from all lines

  _initMarkup: function() {
    let doc = this.parent.ownerDocument;

    let presetPane = doc.createElement("div");
    presetPane.className = "preset-pane";

    let categoryList = doc.createElement("div");
    categoryList.id = "preset-categories";

    let presetContainer = doc.createElement("div");
    presetContainer.id = "preset-container";

    //This function is completely broken. Kill it.
    Object.keys(PRESETS).forEach(categoryLabel => {
      let category = this._createCategory(categoryLabel);
      categoryList.appendChild(category);

      let presetList = this._createPresetList(categoryLabel);
      presetContainer.appendChild(presetList);
    });

    //change these lines to presetPane.parent.appendChild(...
    presetPane.appendChild(categoryList);
    presetPane.appendChild(presetContainer);
    presetPane.appendChild(categoryLabel);
    presetPane.appendChild(presetLabel);
    presetPane.appendChild(presetPane);

    this.parent.appendChild(presetPane);

    let allCategories = presetPane.querySelectorAll(".category");
    let allPresets = presetPane.querySelectorAll(".preset");

    return {
      presetPane: presetPane,
      presets: allPresets,                                                    wow
      categories: allCategories
    };
  }

# Registers
- Basically, unlimited clipboards. To access registers you use " <- (double quote)
"<char><motion> <- copy text into buffer <char>
"<char>p <- put contents of register
:reg <- view all allocated registers
* <- special register for system clipboard

Example:
  "ayy <- copy current line into register a
  "ap  <- put line

# Vim Combos to live and die by:
 ciw - delete word and move into insert mode
 ci" - delete within quotes and move into insert mode
 cit - delete with html tags and move into insert mode
 diw - delete whole word regardless of cursor position, stay in normal mode
 ci( - delete up until surrounding parens and enter insert mode
 ci{ - delete up until braces
 <<  - move line left
 >>  - move line right
 2>> - move 2 lines right

  Exercise: Fix indentation
  Exercise: Change `matrix` to `table` - try ciw
  Exercise: Change println message - try ci"

  public static String lcs(String m, String n) {
      int[][] matrix = new int[m.length()+1][n.length()+1];
  findCommonChars(matrix, m, n);
  return findPath(matrix, " " + m, " " + n, m.length(), n.length());
  }

  public static void findCommonChars(int[][] matrix, String m, String n) {
    System.out.println(String.format("The contents of m is %s", m));
      for(int i = 1; i < m.length(); i++) {
          for(int j = 1; j < n.length(); j++) {
              if(m.charAt(i) == n.charAt(j)) {
                  matrix[i][j] = matrix[i-1][j-1] + 1;
              } else {
                  matrix[i][j] = Math.max(matrix[i-1][j], matrix[i][j-1]);
              }
          }
      }
  }

# Personal Favourites:
  The dot! . <- repeats the previous action
  Vim caches your last operation and allows you to replay it using the dot

 Exercise: delete these dd....
 I will always use the arrow keys
 I will always use the arrow keys
 I will always use the arrow keys
 I will always use the arrow keys
 I will always use the arrow keys

Exercise: Rename `matrix` to `table` <- try f,bciwtable<esc>.
Exercise: Shift all the lines to left a couple times

  public static String findPath(int[][] matrix, String m, String n, int x, int y) {
            if(x == 0 || y == 0) {
                return "";
            } else if(m.charAt(x) == n.charAt(y)) {
                return findPath(matrix, m, n, x-1, y-1) + m.charAt(x);
            } else {
                if(matrix[x][y-1] > matrix[x-1][y]) {
                    return findPath(matrix, m, n, x, y-1);
                } else {
                    return findPath(matrix, m, n, x-1, y);
                }
            }
  }


# Searching
 /<term>
 n -> move to next
 N -> move to prev (like less)
 * -> search for word under cursor

 Exercise: search for 'wow' advance until you get back here

# Find and Replace
 :%s/foo/bar/g <- replace all foo with bar
 :s/foo/bar/g <- replace all foo with bar on current line only

 Replace within selection
 v <- enter visual mode
 }}{{} <- select some blocks
 : <- enter command mode
 s/foo/bar/g

 Exercise: replace 'wow' with something else
 Exercise: replace 'this' with 'self' on this line only.
   return (this.parent == null) ? this.firstChild : this.parent;


 Exercise: replace 'matrix' with 'graph' in this function only (don't screw up)

  public static String findPath(int[][] matrix, String m, String n, int x, int y) {
            if(x == 0 || y == 0) {
                return "";
            } else if(m.charAt(x) == n.charAt(y)) {
                return findPath(matrix, m, n, x-1, y-1) + m.charAt(x);
            } else {
                if(matrix[x][y-1] > matrix[x-1][y]) {
                    return findPath(matrix, m, n, x, y-1);
                } else {
                    return findPath(matrix, m, n, x-1, y);
                }
            }
  }

# Marks (code shortcuts or large motions)
Convenient for remembering a location you want to get back to, or a large block
of text you want to delete/yank.

ma <- bind current position to 'a'
'a <- move cursor back to a

# The Command Bar
: <- enable prompt
:q <- quit
:q! <- quit without saving
:w <- write current file (aka save)
:wq <- write and quit
:w <filename> write current file as (aka save as..)
:e <filename> <- open file
:e . <- open directory
:!<shell_command> <- run shell command, background vim, display output.
  - try :!ls
<C-o> cycle back through cursor positions across files
<C-i> cycle forward through cursor positions across files

Exercise: Open and close this doc. Come back to this line.
Exercise: Open rbtree.c in this directory, cycle back here, cycle back

# Windowing in Vim
:vsplit <filename> <- open vertical pane
:split <filename> <- open horizontal pane
<C-W>j|k|l|h <- switch window

Exercise:
  - vsplit rbtree.c, jump back and forth through windows
  - close rbtree.c
Exercise:
  - vsplit rbtree.c and then split gc.c <- #dope
  - close all but this file.

# Background/Foregrounding Vim
- Very useful when multitasking. Often you don't want to
  los window state.

<C-z> <- send vim to the background
jobs <- list all backgrounded processes
fg   <- bring process top of stack to front.
fg %n <- bring job n to foreground

# Bringing it all together

Exercise: Setup .ssh/config
 - background vim
 - cd ~
 - vim .ssh, open config
 - add: Host ubc
        Hostname remote.ugrad.cs.ubc.ca
        User g6b8
 - :wq
 - ssh ubc (l33t)
 - fg

# Customizing Vim / Must have plugins

.vimrc <- runtime configs for vim
 - Sane Defaults
 - ExtremeRCs: ujis_vimrc.sh

## Basic Key Mapping
 - Lots of different key bindings that you can scope to different modes
   `map` does for all insert, command, visual, etc.
 map <new_sequence> <old_sequence>

Exercise: Add Nicer Key Bindings for Windows to .vimrc

  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

## Plugins

# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh <- scary, I know. can clone repo if you want.
open vim, run :NeoBundleInstall

Add to vimrc
NeoBundle 'scrooloose/syntastic'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'

# CtrlP
<C-p>fuzzytype
<C-o> cycle back through cursor positions across files
<C-i> cycle forward through cursor positions across files

# NerdTree
Suggested, add
map <Leader>n :NERDTreeToggle<CR>

# Macros (time permitting
# Terminal Multiplexing with tmux

set mouse=a <- lol




















wow
