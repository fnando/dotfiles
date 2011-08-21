# Display methods added by this object.
#
def m(object)
  (object.methods - object.class.superclass.instance_methods).sort
end
