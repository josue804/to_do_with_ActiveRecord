require('spec_helper')

describe(Task) do

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.create({:description => "learn SQL", :done => false, :rank => 2})
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#belongs_to') do
    it('tells which list the task belongs to') do
      test_list = List.create({:name => 'list'})
      test_task = Task.create({:description => "task", :rank => 1, :list_id => test_list.id})
      expect(test_task.list()).to(eq(test_list))
    end
  end
end
