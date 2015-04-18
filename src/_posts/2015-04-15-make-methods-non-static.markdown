---
layout: post
title:  "Using Resharper to Refactor Static Methods or Properties Into Instance Methods"
categories: refactoring resharper
---
This is an example of how you can combine a bunch of smaller automated refactorings to achieve an effect for which there is no automated refactoring in a safe and non-manual way.
*Note: All short cut keys given are with Resharper configured with the Visual Studio hotkey choice*

If you see the following sort of code:

{% highlight csharp %}
public static class A
{
	public static string Method1(string p)
	{
		return p;
	}

	public static string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}

First, remove the static keyword off the class leaving you with the following.

{% highlight csharp %}
public class A
{
	public static string Method1(string p)
	{
		return p;
	}

	public static string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}
    
Rebuild, there should be no other changes required at this point for a successful build. Next, to make the method non-static we are going to add a local variable to that method that is an instance of class A as follows:

{% highlight csharp %}
public class A
{
	public static string Method1(string p)
	{
		var self = new A();
		return p;
	}

	public static string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}
    
Next, we will promote self to a parameter using Resharper.  To do this highlight the word self. Now, either right click on the highlighted word and go to Refactor -> Introduce Parameter or use the keyboard shortcut CTRL R, P. You should be in the introduce parameter popup. Accept all the defaults and hit next until completed.
 
This should result in code that looks like the following:

{% highlight csharp %}
public class A
{
	public static string Method1(string p, A self)
	{
		return p;
	}

	public static string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}

And everywhere that method is called will now look like A.Method1("a string", new A());

Now right click on Method1 and choose Refactor -> Make Method Non-Static.
You should get a popup. Make sure the parameter of type A is highlighted in the popup and hit next.

This will result in code that looks like the following:

{% highlight csharp %}
public class A
{
	public string Method1(string p)
	{
		return p;
	}

	public static string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}

And all callers should look like the following: 

{% highlight csharp %}
new A().Method1("some text");
{% endhighlight %}
 
Now, for the property we have to add 2 steps:
First, highlight the name of the property, right click, and choose Refactor -> Convert Property to Method. You should get a popup. Accept all the defaults and hit next until done.  Now you should have code that looks like the following:

{% highlight csharp %}
public class A
{
	public string Method1(string p)
	{
		return p;
	}

	public static string GetProperty1()
	{
		return "abc";
	}
}
{% endhighlight %}

Now we have a method so we can do all the steps above, add a local variable of type A, introduce it as a parameter, and convert method to non-static.  Finally we can use Resharper to convert the method back to a property. Right click on the property name and go to Refactor -> Convert Method to Property. Accept all the defaults in the popup and hit next until done.

Finally you should now have code like the following:

{% highlight csharp %}
public class A
{
	public string Method1(string p)
	{
		return p;
	}

	public string Property1
	{
		get
		{
			return "abc";
		}
	}
}
{% endhighlight %}

I know this seems like a lot of steps but once you do it a few times it won't feel so bad and it is a heck of a lot quicker than hand fixing 20 callers. Also, since it is fully automated it is a technique that allows you to feel confident you are not changing the behavior of the code even though you don't have tests for it yet.